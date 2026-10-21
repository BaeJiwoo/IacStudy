# AWS IaC 자동 배포 서비스 실습 과정

이 저장소는 클라우드 인프라 엔지니어가 AWS 아키텍처를 설계하고, CloudFormation과 Terraform으로 구현하며, 안전한 자동 배포 서비스로 운영하는 과정을 작업 단위로 학습하도록 구성한 실습 프로젝트다. 기간을 정해 진도를 맞추기보다 각 과제의 조사, 구현, 검증, 실패 복구와 기록을 완료한 뒤 다음 단계로 이동한다.

## 학습 결과

과정을 완료하면 다음을 설명하고 구현할 수 있어야 한다.

- AWS Organization, Account, Region, Availability Zone, VPC와 Subnet의 경계를 반영한 아키텍처 설계
- 네트워크, 컴퓨팅, 데이터, 보안, 관측성과 복구 요구사항의 연결
- CloudFormation Template, Stack, Change Set, StackSets와 Drift의 운영
- AWS CDK의 Construct와 Synthesis, AWS SAM의 서버리스 배포 흐름 설명
- Terraform Module, State, Import, Refactoring과 리소스 수명 주기 관리
- Pull Request Plan, OIDC, Policy as Code와 승인 기반 Apply 구현
- Service Catalog, Control Tower와 AFT를 이용한 조직 수준 셀프서비스 설계
- 배포 요청부터 감사, Drift 탐지와 복구까지 이어지는 자동 배포 서비스 구현

## 학습 흐름

```text
AWS 아키텍처
01 → 02 → 03 → 04 → 05 → 06
                         │
                         ▼
AWS 네이티브 IaC
07 → 08 → 09
           │
           ▼
Terraform과 배포 안전장치
10 → 11 → 12 → 13 → 14 → 15
                              │
                              ▼
조직 플랫폼과 자동 배포 서비스
16 → 17 → 18 → 19 → 20
```

상세 의존 관계와 단계별 결과물은 [학습 지도](./learning-map.md)에서 확인한다.

## 작업 디렉터리

| 번호 | 과제 | 핵심 결과물 |
| --- | --- | --- |
| 01 | [AWS 리소스 구조](./01-aws-resource-structure/) | 리소스 범위와 장애 경계 |
| 02 | [VPC 네트워크](./02-vpc-networking/) | CIDR과 패킷 경로 설계 |
| 03 | [컴퓨팅과 트래픽](./03-compute-traffic/) | 컴퓨팅 및 확장 방식 선택 |
| 04 | [데이터와 저장소](./04-data-storage/) | 저장소와 복구 목표 설계 |
| 05 | [멀티 계정과 보안](./05-multi-account-security/) | 계정 및 권한 경계 설계 |
| 06 | [관측성과 Well Architected](./06-observability-well-architected/) | 운영 신호와 아키텍처 검토 |
| 07 | [CloudFormation 기본](./07-cloudformation-basics/) | Template과 Stack 배포 |
| 08 | [CloudFormation 운영](./08-cloudformation-operations/) | Change Set, StackSets, Guard와 복구 |
| 09 | [CDK와 SAM](./09-cdk-and-sam/) | 코드 기반 Construct와 서버리스 배포 |
| 10 | [Terraform 기본](./10-terraform-basics/) | VPC 코드와 Terraform 실행 |
| 11 | [Terraform 자원 수명 주기](./11-terraform-resource-lifecycle/) | Import, Refactoring과 기존 자원 편입 |
| 12 | [Module과 원격 State](./12-modules-remote-state/) | 재사용 Module과 S3 Backend |
| 13 | [Pull Request Plan](./13-pr-plan-pipeline/) | 자동 Plan Pipeline |
| 14 | [OIDC Cross Account](./14-oidc-cross-account/) | 정적 키 없는 AWS 배포 |
| 15 | [테스트와 정책](./15-testing-policy-as-code/) | 배포 전 보안 및 정책 차단 |
| 16 | [Service Catalog와 Control Tower](./16-service-catalog-control-tower/) | 조직 수준 표준 제품과 계정 공급 |
| 17 | [배포 서비스 모델](./17-deployment-service-model/) | API와 비동기 Worker 설계 |
| 18 | [GitOps 승인과 Apply](./18-gitops-approval-apply/) | 승인된 변경의 Apply |
| 19 | [감사 Drift 복구](./19-audit-drift-recovery/) | 변경 추적, Drift와 장애 복구 |
| 20 | [최종 통합](./20-capstone-production-review/) | 운영 가능한 자동 배포 서비스 |

## 각 과제 사용법

각 번호 디렉터리에서 다음 순환을 완료한다.

1. `README.md`에서 목표, 선행 과제와 결과물을 확인한다.
2. `keywords.md`의 용어를 자신의 말로 설명한다.
3. `research.md`의 공식 자료를 읽고 조사 질문에 답한다.
4. `assignment.md`와 준비된 실습 파일을 이용해 구현한다.
5. `tests/`의 정상 및 실패 시나리오로 결과를 검증한다.
6. `submission/`에 학습 기록, 설계 결정과 실행 결과를 남긴다.
7. `checklist.md`를 모두 충족한 뒤 [진행표](./progress.md)를 갱신한다.

실행 성공만으로 과제를 완료하지 않는다. 다른 사람이 저장소를 받아 재현할 수 있고, 실패 원인을 찾고 복구할 수 있어야 한다.

## 시작 전 준비

- 별도의 AWS Sandbox 계정과 Budget 알림
- 기본 리전 `ap-northeast-2`
- AWS CLI, Git, Docker와 `jq`
- CloudFormation `cfn-lint`, AWS SAM CLI, Node.js
- Terraform 또는 OpenTofu, TFLint와 Checkov
- GitHub Actions 또는 조직에서 사용하는 동등한 CI 도구

NAT Gateway, RDS, EKS처럼 비용이 지속되는 리소스는 실습 직후 제거하고 삭제 여부를 확인한다. 자격 증명, Terraform State와 민감한 출력은 Git에 커밋하지 않는다.

## 안내 문서

| 문서 | 용도 |
| --- | --- |
| [학습 지도](./learning-map.md) | 단계, 의존 관계와 결과물 파악 |
| [작업 단위 커리큘럼](./01-curriculum.md) | 20개 과제의 상세 설명 |
| [핵심 용어집](./glossary.md) | 주요 단어의 의미와 관련 과제 탐색 |
| [진행표](./progress.md) | 과제 상태와 증거 링크 기록 |
| [AWS 아키텍처 학습 가이드](./00-aws-architecture.md) | AWS 구조와 설계 관점 복습 |
| [최종 프로젝트 명세](./02-capstone-project.md) | 자동 배포 서비스의 기능과 아키텍처 |
| [공식 자료](./03-references.md) | AWS와 Terraform 공식 문서 모음 |
| [운영 준비 체크리스트](./checklists/production-readiness.md) | 최종 결과물 운영 검토 |
| [학습 기록 템플릿](./templates/study-log.md) | 작업별 문제 해결 기록 |

## 시작하기

[01 AWS 리소스 구조](./01-aws-resource-structure/)에서 시작한다. 이미 알고 있는 영역도 `checklist.md`의 완료 기준과 실행 증거를 남긴 뒤 건너뛴다.
