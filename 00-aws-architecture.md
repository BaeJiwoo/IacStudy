# 클라우드 인프라 엔지니어를 위한 AWS 아키텍처 학습 가이드

IaC 코드는 아키텍처 결정을 자동화하는 수단이다. 계정 경계, 리소스 범위, 네트워크 경로, 장애 격리와 데이터 보호를 이해하지 못한 상태에서 코드를 먼저 작성하면 잘못된 구조를 빠르게 반복하게 된다. 이 가이드는 AWS 구조를 큰 경계에서 작은 리소스 순서로 이해하고, 하나의 워크로드 아키텍처를 직접 설계하도록 구성한다.

## 시작 전 진단 질문

다음 질문에 근거를 들어 답할 수 없다면 해당 작업부터 시작한다.

- AWS Account, Region, Availability Zone, VPC와 Subnet은 각각 어떤 격리 경계인가
- IAM, Route 53, VPC, Subnet, EC2, EBS, S3와 RDS는 각각 Global, Regional, Zonal 중 어디에 속하는가
- Public Subnet과 Private Subnet을 구분하는 핵심 조건은 무엇인가
- Internet Gateway, NAT Gateway, VPC Endpoint와 Transit Gateway는 각각 어떤 통신 문제를 해결하는가
- Security Group과 Network ACL의 적용 대상과 상태 추적 방식은 어떻게 다른가
- 애플리케이션을 여러 Availability Zone에 배치해도 단일 장애점이 남을 수 있는 곳은 어디인가
- AWS Account를 환경, 워크로드 또는 조직 단위로 나누는 기준은 무엇인가
- RTO와 RPO가 아키텍처와 비용에 어떤 영향을 주는가
- 로그, 보안 탐지와 백업을 워크로드 계정 밖에 보관하는 이유는 무엇인가
- 이 아키텍처를 Terraform State 단위로 어떻게 나눌 것인가

## AWS 리소스 계층

```text
AWS Organization
└─ Organizational Unit
   └─ AWS Account
      ├─ Global 또는 계정 수준 서비스
      │  ├─ IAM
      │  ├─ Route 53
      │  └─ CloudFront
      └─ Region
         ├─ Regional 서비스와 리소스
         │  ├─ VPC
         │  ├─ S3 Bucket
         │  ├─ DynamoDB Table
         │  └─ ECS Cluster
         └─ Availability Zone
            ├─ Subnet
            ├─ EC2 Instance
            └─ EBS Volume
```

이 구조는 소유 관계를 완전히 표현한 트리가 아니라 리소스 범위와 장애 경계를 학습하기 위한 모델이다. 예를 들어 S3는 Regional 서비스지만 VPC 안에 생성되는 리소스가 아니다. VPC Endpoint를 사용하면 VPC의 워크로드가 인터넷 경로 없이 S3 같은 지원 서비스에 접근할 수 있다.

## 아키텍처를 보는 일곱 계층

| 계층 | 핵심 질문 | 대표 서비스 |
| --- | --- | --- |
| 조직과 거버넌스 | 누가 소유하고 어떤 정책을 강제하는가 | Organizations, Control Tower, IAM Identity Center, SCP |
| 엣지와 진입점 | 사용자의 요청이 어디에서 보호되고 분산되는가 | Route 53, CloudFront, WAF, API Gateway, ALB |
| 네트워크 | 어떤 경로로 통신하고 어디에서 격리되는가 | VPC, Subnet, Route Table, NAT Gateway, Transit Gateway, PrivateLink |
| 컴퓨팅 | 애플리케이션이 어디에서 실행되고 확장되는가 | EC2, Auto Scaling, ECS, EKS, Lambda |
| 데이터 | 데이터가 어디에 저장되고 어떻게 복구되는가 | S3, EBS, EFS, RDS, Aurora, DynamoDB, ElastiCache |
| 보안 | 신원, 비밀, 암호화와 위협을 어떻게 통제하는가 | IAM, KMS, Secrets Manager, GuardDuty, Security Hub |
| 운영 | 상태를 어떻게 관찰하고 변경과 장애에 대응하는가 | CloudWatch, CloudTrail, Config, Systems Manager, Backup |

## 기준 웹 워크로드 아키텍처

```text
사용자
  │
Route 53
  │
CloudFront와 WAF
  │
Internet Facing ALB
  ├─ Public Subnet AZ A
  └─ Public Subnet AZ B
          │
          ▼
ECS Service 또는 EC2 Auto Scaling
  ├─ Private App Subnet AZ A
  └─ Private App Subnet AZ B
          │
          ▼
RDS Multi AZ 또는 DynamoDB
  ├─ Private Data Subnet AZ A
  └─ Private Data Subnet AZ B

운영 경로
  ├─ CloudWatch Logs와 Metrics
  ├─ CloudTrail과 AWS Config
  ├─ Secrets Manager와 KMS
  └─ AWS Backup 또는 서비스별 Backup
```

Public Subnet은 리소스에 Public IP가 있는지를 뜻하지 않는다. Internet Gateway로 향하는 Route가 있는 Subnet이다. Private App Subnet의 워크로드가 인터넷으로 나가야 한다면 NAT Gateway를 사용할 수 있고, AWS 서비스 접근만 필요하다면 VPC Endpoint를 함께 검토한다.

## ARCH 01 글로벌 인프라와 리소스 범위

### 목표

Organization부터 개별 리소스까지 AWS의 관리 및 장애 경계를 설명한다.

### 작업

1. Organization, OU, Account, Region, Availability Zone, VPC와 Subnet을 포함한 계층도를 작성한다.
2. IAM, Route 53, CloudFront, VPC, S3, ECS, RDS, EC2와 EBS의 범위를 분류한다.
3. 단일 AZ 장애와 Region 장애가 각 서비스에 미치는 영향을 표로 작성한다.
4. 데이터 주권, 지연 시간, 서비스 가용성과 비용을 기준으로 Region 선택 근거를 작성한다.

### 산출물

- AWS 리소스 범위 표
- 장애 경계 다이어그램
- Region 선택 결정 기록

### 완료 기준

- Regional 리소스와 Zonal 리소스를 혼동하지 않고 설명할 수 있다.
- Multi AZ와 Multi Region이 해결하는 장애 범위와 비용 차이를 설명할 수 있다.

## ARCH 02 VPC와 네트워크 경로

### 선행 작업

- ARCH 01

### 목표

사용자 요청부터 워크로드와 외부 서비스까지 패킷이 이동하는 경로를 설계한다.

### 작업

1. 겹치지 않는 CIDR과 확장 여유를 고려해 VPC 및 Subnet 주소를 계획한다.
2. 두 개 이상의 Availability Zone에 Public, Private App, Private Data Subnet을 배치한다.
3. Route Table, Internet Gateway, NAT Gateway와 VPC Endpoint 경로를 그린다.
4. Security Group과 Network ACL의 허용 규칙을 비교한다.
5. VPC Peering, Transit Gateway, PrivateLink와 VPC Sharing의 사용 조건을 비교한다.

### 산출물

- CIDR 할당표
- Ingress와 Egress 네트워크 흐름도
- 연결 방식 비교 및 선택 기록

### 완료 기준

- 임의의 두 리소스 사이에서 DNS, Route, Security Group과 Network ACL을 순서대로 점검할 수 있다.
- 인터넷 경로와 AWS 서비스 사설 접근 경로를 구분할 수 있다.

## ARCH 03 컴퓨팅과 트래픽 분산

### 선행 작업

- ARCH 02

### 목표

워크로드 특성에 따라 EC2, ECS, EKS와 Lambda를 비교하고 고가용성 진입 경로를 설계한다.

### 작업

1. 실행 시간, 운영 부담, 확장 방식과 배포 단위를 기준으로 컴퓨팅 서비스를 비교한다.
2. Route 53부터 CloudFront, WAF, ALB 또는 API Gateway까지 요청 경로를 작성한다.
3. Health Check와 Auto Scaling 정책을 설계한다.
4. 하나의 Availability Zone이 중단됐을 때 용량이 유지되는지 계산한다.
5. 배포 방식으로 Rolling, Blue Green과 Canary를 비교한다.

### 산출물

- 컴퓨팅 서비스 선택 기록
- 요청 흐름도
- 장애 시 용량 계획
- 배포 전략 결정 기록

### 완료 기준

- 관리형 서비스를 선택해 줄어드는 운영 책임과 새로 생기는 제약을 함께 설명할 수 있다.
- Load Balancer, Target Group, Health Check와 Auto Scaling의 관계를 설명할 수 있다.

## ARCH 04 데이터와 저장소

### 선행 작업

- ARCH 01
- ARCH 02

### 목표

데이터 접근 패턴, 일관성, 내구성, RTO와 RPO에 맞는 저장소를 선택한다.

### 작업

1. S3, EBS, EFS, RDS, Aurora와 DynamoDB의 접근 방식과 장애 범위를 비교한다.
2. 데이터 분류와 암호화 키 소유권을 정의한다.
3. RDS Multi AZ, Read Replica와 Backup이 해결하는 문제를 구분한다.
4. 복구 시나리오에 대해 RTO와 RPO를 정의한다.
5. 백업 복원 테스트 절차를 작성한다.

### 산출물

- 데이터 저장소 선택표
- 데이터 흐름과 암호화 경계도
- 백업 및 복구 설계

### 완료 기준

- 고가용성, 읽기 확장과 재해 복구를 같은 개념으로 취급하지 않는다.
- Backup이 존재하는 것과 복원이 검증된 것이 다름을 설명할 수 있다.

## ARCH 05 멀티 계정과 보안 구조

### 선행 작업

- ARCH 01

### 목표

워크로드와 조직의 보안 책임을 계정 및 OU 경계에 배치한다.

### 작업

1. Management, Security, Log Archive, Network, Shared Services와 Workload 계정을 설계한다.
2. 사람의 접근과 CI 역할을 분리하고 Cross Account 접근 경로를 작성한다.
3. SCP, IAM Policy, Permission Boundary와 Resource Policy의 역할을 비교한다.
4. CloudTrail, Config, GuardDuty와 Security Hub의 중앙 수집 구조를 설계한다.
5. 비상 접근과 보안 이벤트 대응 흐름을 작성한다.

### 산출물

- OU와 계정 구조
- 권한 및 신뢰 관계 다이어그램
- 중앙 보안 서비스 배치도

### 완료 기준

- AWS Account를 단순한 환경 이름이 아니라 권한, 비용과 장애 영향의 경계로 사용할 수 있다.
- Management 계정과 Log Archive 계정에 일반 워크로드를 두지 않는 이유를 설명할 수 있다.

## ARCH 06 관측성과 운영 구조

### 선행 작업

- ARCH 03
- ARCH 04
- ARCH 05

### 목표

애플리케이션, 인프라, 보안과 변경 이벤트를 함께 추적하는 운영 구조를 설계한다.

### 작업

1. Metrics, Logs, Traces와 Events의 수집 대상을 정한다.
2. 기술 로그와 감사 로그의 보존 위치 및 기간을 구분한다.
3. 정상 상태를 나타내는 지표와 사용자 영향이 있는 경보를 정의한다.
4. CloudTrail과 AWS Config로 변경 주체 및 구성 변화를 추적한다.
5. 장애 대응 Runbook과 Escalation 경로를 작성한다.

### 산출물

- 관측성 데이터 흐름도
- 주요 지표와 경보 목록
- 장애 대응 Runbook

### 완료 기준

- 특정 사용자 오류에서 관련 애플리케이션 로그와 AWS 변경 이벤트까지 추적하는 절차가 있다.
- 경보가 단순 임계값이 아니라 사용자 영향 또는 즉시 조치와 연결된다.

## ARCH 07 Well Architected 설계 검토

### 선행 작업

- ARCH 01부터 ARCH 06

### 목표

하나의 워크로드를 운영 우수성, 보안, 안정성, 성능 효율성, 비용 최적화와 지속 가능성 관점에서 검토한다.

### 작업

1. 기준 웹 워크로드를 자신의 요구사항에 맞게 다시 설계한다.
2. 각 설계 선택의 요구사항, 대안, 장점, 위험과 비용을 기록한다.
3. 단일 장애점과 수동 운영 의존성을 찾는다.
4. 개선 항목을 위험도와 구현 비용으로 우선순위화한다.
5. 아키텍처의 각 경계를 Terraform State와 Module 단위에 매핑한다.

### 산출물

- 최종 AWS 아키텍처 다이어그램
- 아키텍처 결정 기록
- 위험 및 개선 Backlog
- IaC 경계 매핑표

### 완료 기준

- 모든 관리형 서비스를 무조건 사용하는 대신 요구사항과 Trade Off를 근거로 선택한다.
- 컴퓨팅, 데이터, 네트워크, 계정과 운영 구조가 하나의 장애 및 보안 모델로 연결된다.
- 이어지는 IaC 작업에서 어떤 리소스를 같은 Module과 State에 넣을지 설명할 수 있다.

## IaC로 연결하는 기준

AWS 아키텍처 설계를 Terraform으로 옮길 때 다음 질문에 답한다.

- 이 리소스의 수명 주기는 어떤 리소스와 같은가
- 변경 권한과 승인자는 누구인가
- 장애 또는 잠금의 영향 범위를 어디까지 허용할 것인가
- 다른 팀과 환경이 재사용할 부분은 Module인가 입력값인가
- 계정과 리전을 넘는 참조를 어떻게 전달할 것인가
- 데이터 리소스 삭제와 교체를 어떻게 보호할 것인가
- 배포 후 어떤 지표와 상태를 검증할 것인가

이 답을 기준으로 Module, Root Module, State, 배포 역할과 Pipeline 경계를 결정한다.

