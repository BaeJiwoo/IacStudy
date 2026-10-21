# AWS IaC 자동 배포 서비스 작업 단위 커리큘럼

학습은 `01`부터 `20`까지 번호가 붙은 디렉터리에서 진행한다. 기간은 정하지 않으며 각 과제의 조사, 구현, 테스트, 기록과 완료 기준을 충족하면 다음 과제로 이동한다.

## 1단계 AWS 아키텍처

### 01 AWS 리소스 구조

[01-aws-resource-structure](./01-aws-resource-structure/)에서 Organization, Account, Region, Availability Zone과 리소스 범위를 구분한다. Region 선택 기록과 장애 경계 다이어그램을 완성한다.

### 02 VPC 네트워크

[02-vpc-networking](./02-vpc-networking/)에서 CIDR, Subnet, Route Table, Internet Gateway, NAT Gateway와 VPC Endpoint를 이용해 Ingress 및 Egress 경로를 설계한다.

### 03 컴퓨팅과 트래픽

[03-compute-traffic](./03-compute-traffic/)에서 EC2, ECS, EKS와 Lambda를 비교하고 Load Balancer, Health Check, Auto Scaling과 배포 방식을 결정한다.

### 04 데이터와 저장소

[04-data-storage](./04-data-storage/)에서 S3, EBS, EFS, RDS와 DynamoDB를 접근 패턴에 맞춰 선택하고 RTO, RPO 및 복원 시험을 설계한다.

### 05 멀티 계정과 보안

[05-multi-account-security](./05-multi-account-security/)에서 Organizations, OU, Account, SCP와 IAM 역할을 연결하고 중앙 보안 및 로그 계정을 설계한다.

### 06 관측성과 Well Architected

[06-observability-well-architected](./06-observability-well-architected/)에서 Metrics, Logs, Traces와 Events를 정의하고 워크로드를 AWS Well Architected의 여섯 Pillar로 검토한다.

## 2단계 AWS 네이티브 IaC

### 07 CloudFormation 기본

[07-cloudformation-basics](./07-cloudformation-basics/)에서 Template의 Parameters, Resources, Outputs와 Intrinsic Function을 사용해 Stack을 생성하고 갱신한다.

### 08 CloudFormation 운영

[08-cloudformation-operations](./08-cloudformation-operations/)에서 Change Set, Drift Detection, Stack Policy, Rollback, StackSets, CloudFormation Guard와 Hooks의 역할을 실습한다.

### 09 CDK와 SAM

[09-cdk-and-sam](./09-cdk-and-sam/)에서 CDK Construct를 CloudFormation Template으로 합성하고 SAM으로 서버리스 애플리케이션을 로컬 검증 및 배포한다.

## 3단계 Terraform과 배포 안전장치

### 10 Terraform 기본

[10-terraform-basics](./10-terraform-basics/)에서 준비된 Terraform 파일로 VPC와 Subnet을 Plan 및 Apply한다. 변수 Validation, Test, State와 리소스 수명 주기를 학습한다.

### 11 Terraform 자원 수명 주기

[11-terraform-resource-lifecycle](./11-terraform-resource-lifecycle/)에서 기존 AWS 자원을 Import하고 `moved`, `removed`, `import` Block과 `lifecycle`을 이용해 무중단으로 코드를 재구성한다.

### 12 Module과 원격 State

[12-modules-remote-state](./12-modules-remote-state/)에서 VPC를 재사용 Module로 분리하고 암호화, Versioning과 잠금이 적용된 S3 Backend를 구성한다.

### 13 Pull Request Plan

[13-pr-plan-pipeline](./13-pr-plan-pipeline/)에서 Pull Request마다 Format, Validate, Test와 Plan을 실행하고 생성, 변경, 교체와 삭제를 검토자에게 표시한다.

### 14 OIDC Cross Account

[14-oidc-cross-account](./14-oidc-cross-account/)에서 GitHub OIDC와 STS를 사용해 정적 Access Key 없이 Development 및 Production 배포 역할을 인수한다.

### 15 테스트와 Policy as Code

[15-testing-policy-as-code](./15-testing-policy-as-code/)에서 Terraform Test, Checkov, OPA와 CloudFormation Guard로 보안 설정, 필수 태그와 Production 삭제를 검사한다.

## 4단계 조직 플랫폼과 자동 배포 서비스

### 16 Service Catalog와 Control Tower

[16-service-catalog-control-tower](./16-service-catalog-control-tower/)에서 승인된 CloudFormation 제품을 Service Catalog로 제공하고 Control Tower와 AFT의 계정 공급 및 거버넌스 경계를 설계한다.

### 17 자동 배포 서비스 모델

[17-deployment-service-model](./17-deployment-service-model/)에서 배포 요청 API, 상태 전이, 비동기 Worker, Idempotency Key와 State 단위 실행 잠금을 설계한다.

### 18 GitOps 승인과 Apply

[18-gitops-approval-apply](./18-gitops-approval-apply/)에서 Git에 저장된 요청과 Plan을 승인 대상으로 사용하고 승인된 Commit과 Artifact만 Apply하도록 구현한다.

### 19 감사 Drift 복구

[19-audit-drift-recovery](./19-audit-drift-recovery/)에서 배포 이벤트와 AWS 변경 이력을 연결하고 CloudFormation과 Terraform Drift, State 손상 및 Apply 실패를 탐지하고 복구한다.

### 20 최종 통합과 운영 검토

[20-capstone-production-review](./20-capstone-production-review/)에서 앞선 결과를 하나의 자동 배포 서비스로 통합한다. Development와 Production 배포, 정책 위반 차단, 승인, 감사, Drift와 복구 시나리오를 시연한다.

## 공통 완료 기준

모든 과제는 다음 조건을 충족해야 한다.

- 핵심 용어를 자신의 말로 설명할 수 있다.
- 설계 선택과 대안을 근거와 함께 기록했다.
- 정상 시나리오와 의도한 실패 시나리오를 모두 검증했다.
- 자격 증명과 민감한 State를 저장소에 남기지 않았다.
- 비용이 발생하는 실습 자원을 제거하고 확인했다.
- 다른 사람이 실행할 수 있는 명령과 결과 증거를 남겼다.
