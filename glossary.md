# AWS IaC 핵심 용어집

이 용어집은 과제를 시작하기 전에 개념을 빠르게 찾고, 비슷한 용어의 차이를 확인하기 위한 색인이다. 각 정의를 외우기보다 관련 과제에서 직접 설계하거나 실행해 자신의 말로 설명하는 것을 목표로 한다.

## AWS 구조와 네트워크

| 용어 | 의미와 구분 | 관련 과제 |
| --- | --- | --- |
| AWS Organizations | 여러 AWS 계정을 조직 단위로 관리하고 정책과 결제 경계를 구성하는 서비스 | [01](./01-aws-resource-structure/), [05](./05-multi-account-security/) |
| Organizational Unit | 계정을 목적별로 묶고 SCP 같은 조직 정책을 적용하는 논리적 단위 | [05](./05-multi-account-security/) |
| AWS Account | 리소스 소유권, 권한, 비용과 서비스 Quota의 기본 격리 경계 | [01](./01-aws-resource-structure/), [05](./05-multi-account-security/) |
| Region | 서로 격리된 지리적 AWS 서비스 영역. 데이터 주권, 지연 시간, 서비스 가용성과 비용을 고려해 선택한다 | [01](./01-aws-resource-structure/) |
| Availability Zone | Region 안의 독립적인 장애 도메인. Multi AZ는 Region 전체 장애를 해결하지 않는다 | [01](./01-aws-resource-structure/), [03](./03-compute-traffic/) |
| Service Quota | Account와 Region 등에 적용되는 서비스별 Resource 또는 API 한도. Capacity 계획과 계정 공급 과정에서 확인한다 | [01](./01-aws-resource-structure/) |
| VPC | Region 범위의 논리적 네트워크 경계 | [02](./02-vpc-networking/) |
| Subnet | 하나의 Availability Zone에 속하는 VPC 주소 범위 | [02](./02-vpc-networking/) |
| Route Table | 목적지 CIDR 또는 서비스 Prefix에 따라 다음 경로를 결정하는 규칙 집합 | [02](./02-vpc-networking/) |
| Internet Gateway | VPC와 인터넷 사이의 수평 확장형 Gateway. Route와 Public IP 조건이 함께 필요하다 | [02](./02-vpc-networking/) |
| NAT Gateway | Private Subnet의 IPv4 워크로드가 외부로 연결을 시작하도록 하는 관리형 NAT | [02](./02-vpc-networking/) |
| VPC Endpoint | 인터넷 경로 없이 지원 AWS 서비스 또는 Endpoint Service에 접근하는 사설 연결 | [02](./02-vpc-networking/) |
| Transit Gateway | 여러 VPC와 온프레미스 네트워크를 Hub 형태로 연결하는 Regional Router | [02](./02-vpc-networking/) |
| Site to Site VPN | 공용 인터넷 위의 암호화된 Tunnel로 VPC와 외부 네트워크를 연결하는 방식 | [02](./02-vpc-networking/) |
| Direct Connect | 전용 Network Connection으로 온프레미스와 AWS를 연결하는 서비스. 암호화는 별도 요구사항으로 검토한다 | [02](./02-vpc-networking/) |
| VPC IPAM | 여러 Account와 Region의 IP 주소 계획, 할당과 사용 현황을 중앙 관리하는 기능 | [02](./02-vpc-networking/) |
| Security Group | ENI 수준의 Stateful 허용 규칙 | [02](./02-vpc-networking/) |
| Network ACL | Subnet 경계의 Stateless 허용 및 거부 규칙 | [02](./02-vpc-networking/) |

## 컴퓨팅 데이터와 운영

| 용어 | 의미와 구분 | 관련 과제 |
| --- | --- | --- |
| Auto Scaling | 부하와 상태에 따라 컴퓨팅 용량을 자동 조절하는 방식 | [03](./03-compute-traffic/) |
| Target Group | Load Balancer가 Health Check와 요청 전달을 수행하는 대상 집합 | [03](./03-compute-traffic/) |
| Blue Green | 기존 환경과 새 환경을 병렬 운영한 뒤 트래픽을 전환하는 배포 전략 | [03](./03-compute-traffic/) |
| RTO | 장애 후 서비스를 복구해야 하는 목표 시간 | [04](./04-data-storage/) |
| RPO | 장애 시 허용할 수 있는 데이터 손실 시간 범위 | [04](./04-data-storage/) |
| Multi AZ | Availability Zone 장애에 대비한 고가용성 구성. Backup 또는 Multi Region DR과 목적이 다르다 | [04](./04-data-storage/) |
| Observability | Metrics, Logs, Traces와 Events로 시스템 내부 상태를 추론하는 능력 | [06](./06-observability-well-architected/) |
| SLI | 사용자 관점의 서비스 동작을 측정하는 지표 | [06](./06-observability-well-architected/) |
| SLO | SLI가 일정 기간 충족해야 하는 목표 수준 | [06](./06-observability-well-architected/) |
| CloudTrail | AWS API 활동과 계정 이벤트를 기록하는 감사 서비스 | [06](./06-observability-well-architected/), [19](./19-audit-drift-recovery/) |
| AWS Config | AWS 리소스 구성과 변경 관계를 기록하고 규칙 준수를 평가하는 서비스 | [06](./06-observability-well-architected/), [19](./19-audit-drift-recovery/) |
| Well Architected | 운영 우수성, 보안, 안정성, 성능 효율성, 비용 최적화와 지속 가능성 관점의 설계 프레임워크 | [06](./06-observability-well-architected/) |

## 신원 보안과 거버넌스

| 용어 | 의미와 구분 | 관련 과제 |
| --- | --- | --- |
| IAM Policy | AWS API 작업을 어떤 조건에서 허용하거나 명시적으로 거부할지 정의하는 문서 | [05](./05-multi-account-security/) |
| Trust Policy | 어떤 Principal이 IAM Role을 인수할 수 있는지 정의하는 Resource Policy | [05](./05-multi-account-security/), [14](./14-oidc-cross-account/) |
| SCP | Organization의 Account 또는 OU에 적용하는 최대 권한 경계. 자체적으로 권한을 부여하지 않는다 | [05](./05-multi-account-security/) |
| RCP | Organization에서 지원 Resource의 Resource Policy에 적용되는 최대 권한 경계. 자체적으로 권한을 부여하지 않는다 | [05](./05-multi-account-security/) |
| Permission Boundary | IAM User 또는 Role에 부여할 수 있는 최대 권한을 제한하는 정책 | [05](./05-multi-account-security/) |
| IAM Access Analyzer | 외부 또는 미사용 접근을 분석하고 정책 생성 및 검증을 지원하는 IAM 기능 | [05](./05-multi-account-security/) |
| STS AssumeRole | 임시 자격 증명을 발급받아 Role 권한으로 작업하는 API | [14](./14-oidc-cross-account/) |
| OIDC | 외부 CI가 장기 Access Key 없이 신원 토큰으로 AWS Role을 인수하게 하는 연합 인증 방식 | [14](./14-oidc-cross-account/) |
| Least Privilege | 필요한 작업, 리소스, 조건과 기간만 허용하는 권한 설계 원칙 | [05](./05-multi-account-security/), [14](./14-oidc-cross-account/) |
| Control Tower | Landing Zone, Account Factory와 Control을 이용해 멀티 계정 AWS 환경을 설정하고 관리하는 서비스 | [16](./16-service-catalog-control-tower/) |
| AFT | Terraform Pipeline을 통해 Control Tower 계정 공급과 계정별 Customization을 자동화하는 방식 | [16](./16-service-catalog-control-tower/) |
| Service Catalog | 관리자가 승인한 CloudFormation 제품을 Portfolio로 배포하도록 제공하는 서비스 | [16](./16-service-catalog-control-tower/) |
| Control | 멀티 계정 환경의 예방, 탐지 또는 사전 대응형 거버넌스 규칙 | [16](./16-service-catalog-control-tower/) |

## CloudFormation CDK와 SAM

| 용어 | 의미와 구분 | 관련 과제 |
| --- | --- | --- |
| Template | AWS 리소스의 원하는 상태를 JSON 또는 YAML로 선언한 CloudFormation 문서 | [07](./07-cloudformation-basics/) |
| Stack | 하나의 CloudFormation Template에서 함께 생성, 갱신, 삭제되는 리소스 단위 | [07](./07-cloudformation-basics/) |
| Parameter | Stack 실행 시 전달하는 입력값. 비밀 값을 평문 기본값으로 두지 않는다 | [07](./07-cloudformation-basics/) |
| Output | Stack이 내보내는 식별자나 값. Export를 사용하면 Stack 간 결합이 생긴다 | [07](./07-cloudformation-basics/) |
| Intrinsic Function | `Ref`, `Sub`, `GetAtt`처럼 Template 안에서 값을 계산하고 리소스를 연결하는 함수 | [07](./07-cloudformation-basics/) |
| Change Set | Stack 갱신 전에 예상 리소스 변경을 생성하고 검토하는 CloudFormation 객체 | [08](./08-cloudformation-operations/) |
| Stack Policy | Stack 갱신 중 중요한 리소스가 변경되는 것을 제한하는 정책 | [08](./08-cloudformation-operations/) |
| Drift | 실제 리소스 구성이 Template 또는 IaC State의 기대 상태와 달라진 상태 | [08](./08-cloudformation-operations/), [19](./19-audit-drift-recovery/) |
| StackSets | 여러 Account와 Region에 Stack을 배포하고 갱신하는 CloudFormation 기능 | [08](./08-cloudformation-operations/) |
| CloudFormation Guard | 선언형 규칙으로 CloudFormation Template과 구조화 데이터를 검사하는 Policy as Code 도구 | [08](./08-cloudformation-operations/), [15](./15-testing-policy-as-code/) |
| CloudFormation Hook | CloudFormation 작업 전 리소스 구성을 평가해 경고하거나 차단하는 확장 지점 | [08](./08-cloudformation-operations/) |
| CDK Construct | AWS CDK 애플리케이션을 구성하는 재사용 가능한 프로그래밍 모델 단위 | [09](./09-cdk-and-sam/) |
| Synthesis | CDK 코드를 CloudFormation Template과 Asset으로 변환하는 과정 | [09](./09-cdk-and-sam/) |
| CDK Bootstrap | CDK 배포에 필요한 S3 Bucket, ECR Repository와 IAM Role을 환경에 준비하는 작업 | [09](./09-cdk-and-sam/) |
| AWS SAM | CloudFormation을 확장해 서버리스 리소스와 로컬 개발 흐름을 제공하는 프레임워크 | [09](./09-cdk-and-sam/) |

## Terraform

| 용어 | 의미와 구분 | 관련 과제 |
| --- | --- | --- |
| Provider | Terraform이 외부 API와 통신하도록 리소스와 Data Source를 제공하는 Plugin | [10](./10-terraform-basics/) |
| Resource | Terraform이 생성하거나 관리하는 인프라 객체 선언 | [10](./10-terraform-basics/) |
| Data Source | Terraform 밖에서 존재하는 정보를 읽는 선언. 자원 소유권을 가져오지 않는다 | [10](./10-terraform-basics/) |
| State | Resource Address와 실제 원격 객체를 연결하고 메타데이터를 저장하는 Terraform 데이터 | [10](./10-terraform-basics/), [12](./12-modules-remote-state/) |
| Plan | 현재 상태와 구성의 차이를 계산한 예상 변경 집합 | [10](./10-terraform-basics/), [13](./13-pr-plan-pipeline/) |
| Import | 기존 원격 객체를 Terraform Resource Address와 State에 연결하는 작업 | [11](./11-terraform-resource-lifecycle/) |
| Import Block | Import 대상을 구성에 선언해 Plan과 코드 검토 흐름에 포함하는 Block | [11](./11-terraform-resource-lifecycle/) |
| Moved Block | Resource Address 변경을 선언해 불필요한 삭제와 재생성을 방지하는 Block | [11](./11-terraform-resource-lifecycle/) |
| Lifecycle | 생성 전 삭제, 삭제 방지, 변경 무시와 교체 조건 같은 자원 동작을 조절하는 Meta Argument | [11](./11-terraform-resource-lifecycle/) |
| Module | 관련 Resource를 입력과 출력으로 캡슐화한 재사용 가능한 Terraform 구성 | [12](./12-modules-remote-state/) |
| Backend | State를 저장하고 실행 잠금을 제공하는 위치와 방식 | [12](./12-modules-remote-state/) |
| State Lock | 동시에 실행되는 변경이 같은 State를 손상시키지 않도록 직렬화하는 잠금 | [12](./12-modules-remote-state/) |
| Provider Alias | 같은 Provider의 여러 Region 또는 Account 구성을 구분하는 이름 | [11](./11-terraform-resource-lifecycle/), [12](./12-modules-remote-state/) |

## 자동 배포 서비스

| 용어 | 의미와 구분 | 관련 과제 |
| --- | --- | --- |
| Policy as Code | 배포 가능 조건을 실행 가능한 규칙과 테스트로 관리하는 방식 | [15](./15-testing-policy-as-code/) |
| GitOps | Git의 선언 상태와 검토 이력을 변경의 기준으로 사용하는 운영 모델 | [18](./18-gitops-approval-apply/) |
| Artifact | Plan, Change Set 정보, 검사 결과처럼 다음 단계가 검증하고 소비하는 변경 산출물 | [13](./13-pr-plan-pipeline/), [18](./18-gitops-approval-apply/) |
| Idempotency Key | 같은 요청이 재전송돼도 배포가 중복 생성되지 않도록 요청을 식별하는 값 | [17](./17-deployment-service-model/) |
| Concurrency Lock | 같은 Stack 또는 State에 대한 동시 변경을 막는 실행 제어 | [17](./17-deployment-service-model/) |
| Approval Gate | Production 같은 환경에서 명시적 승인을 받은 변경만 실행하도록 하는 통제 | [18](./18-gitops-approval-apply/) |
| Audit Trail | 요청자, 검토자, 실행 주체, 입력, 변경과 결과를 연결한 추적 기록 | [19](./19-audit-drift-recovery/) |
| Runbook | 장애나 운영 작업을 진단하고 복구하기 위한 단계별 절차 | [19](./19-audit-drift-recovery/) |
| Rollback | 실패한 변경에서 이전 동작 상태로 돌아가는 과정. 모든 데이터 변경이 자동 복구되는 것은 아니다 | [08](./08-cloudformation-operations/), [19](./19-audit-drift-recovery/) |
