# AWS IaC 자동 배포 서비스 작업 디렉터리

학습은 `01`부터 `15`까지 번호가 붙은 디렉터리에서 진행한다. 기간은 정하지 않으며 각 디렉터리의 조사 질문, 시작 파일, 제출물과 완료 기준을 충족하면 다음 과제로 이동한다.

## 전체 흐름

```text
AWS 구조와 아키텍처
01 → 02 → 03 → 04 → 05 → 06
                         │
                         ▼
Terraform과 배포 Pipeline
07 → 08 → 09 → 10 → 11
                         │
                         ▼
자동 배포 서비스와 운영
12 → 13 → 14 → 15
```

## 01 AWS 리소스 구조

디렉터리: [01-aws-resource-structure](./01-aws-resource-structure/)

Organization, Account, Region, Availability Zone과 리소스 범위를 구분한다. Region 선택 기록과 장애 경계 다이어그램을 완성한다.

## 02 VPC 네트워크

디렉터리: [02-vpc-networking](./02-vpc-networking/)

CIDR, Subnet, Route Table, Internet Gateway, NAT Gateway와 VPC Endpoint를 이용해 Ingress 및 Egress 경로를 설계한다.

## 03 컴퓨팅과 트래픽

디렉터리: [03-compute-traffic](./03-compute-traffic/)

EC2, ECS, EKS와 Lambda를 비교하고 Load Balancer, Health Check, Auto Scaling과 배포 방식을 결정한다.

## 04 데이터와 저장소

디렉터리: [04-data-storage](./04-data-storage/)

S3, EBS, EFS, RDS와 DynamoDB를 접근 패턴에 맞춰 선택하고 RTO, RPO 및 복원 시험을 설계한다.

## 05 멀티 계정과 보안

디렉터리: [05-multi-account-security](./05-multi-account-security/)

Organizations, OU, Account, SCP와 IAM 역할을 연결하고 중앙 보안 및 로그 계정을 설계한다.

## 06 관측성과 Well Architected

디렉터리: [06-observability-well-architected](./06-observability-well-architected/)

Metrics, Logs, Traces와 Events를 정의하고 완성된 워크로드를 AWS Well Architected 여섯 Pillar로 검토한다.

## 07 Terraform 기본

디렉터리: [07-terraform-basics](./07-terraform-basics/)

준비된 Terraform 파일로 VPC와 Subnet을 Plan 및 Apply한다. 변수 Validation, Test, State와 리소스 수명 주기를 학습한다.

## 08 Module과 원격 State

디렉터리: [08-modules-remote-state](./08-modules-remote-state/)

VPC를 재사용 Module로 분리하고 S3 Versioning, 암호화와 Lockfile이 적용된 원격 State를 구성한다.

## 09 Pull Request Plan

디렉터리: [09-pr-plan-pipeline](./09-pr-plan-pipeline/)

Pull Request에서 Format, Validate, Test와 Plan을 실행하고 생성, 변경, 교체와 삭제를 검토자에게 표시한다.

## 10 OIDC Cross Account

디렉터리: [10-oidc-cross-account](./10-oidc-cross-account/)

GitHub OIDC와 STS를 사용해 정적 Access Key 없이 Development 및 Production 배포 역할을 인수한다.

## 11 테스트와 Policy as Code

디렉터리: [11-testing-policy-as-code](./11-testing-policy-as-code/)

Terraform Test, Checkov와 Plan JSON 정책으로 보안 설정, 필수 태그와 Production 삭제를 검사한다.

## 12 자동 배포 서비스 모델

디렉터리: [12-deployment-service-model](./12-deployment-service-model/)

배포 요청 API, 상태 전이, 비동기 Worker, Idempotency Key와 State 단위 실행 잠금을 설계한다.

## 13 GitOps 승인과 Apply

디렉터리: [13-gitops-approval-apply](./13-gitops-approval-apply/)

요청을 Git 변경으로 만들고 승인된 Commit 및 Plan만 대상 계정에 적용한다.

## 14 감사 Drift와 장애 복구

디렉터리: [14-audit-drift-recovery](./14-audit-drift-recovery/)

Request ID부터 CloudTrail까지 추적하고 Drift, 부분 Apply, State 손상, 잠금 잔류와 비용 이상에 대응한다.

## 15 최종 통합과 운영 검토

디렉터리: [15-capstone-production-review](./15-capstone-production-review/)

앞선 모든 결과를 하나의 자동 배포 서비스로 통합하고 정상, 정책 거부, 승인 무효화, Drift와 복구 시나리오를 시연한다.

## 과제별 공통 제출 원칙

- 조사 질문은 자신의 말로 답하고 공식 자료 링크를 남긴다.
- 설계에는 요구사항, 대안, 선택 근거와 받아들이는 위험을 기록한다.
- 코드는 Format, Validate와 가능한 테스트를 통과한다.
- 성공 결과뿐 아니라 의도한 실패와 복구 결과를 남긴다.
- AWS 리소스를 생성한 과제는 비용과 삭제 여부를 확인한다.
- 완료한 과제는 별도 Git Commit으로 남긴다.
