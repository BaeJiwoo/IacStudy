# AWS IaC 자동 배포 서비스 학습 과정

이 과정은 클라우드 인프라 엔지니어가 AWS 아키텍처를 이해하고 IaC 기반 자동 배포 서비스를 직접 설계하도록 구성한 작업 단위 학습 프로젝트다. 완료 기간을 정하지 않고 선행 작업과 완료 기준을 충족하면서 진행한다. AWS 리소스 계층, 네트워크, 컴퓨팅, 데이터와 보안 구조를 학습한 뒤 Terraform, CI/CD, 승인, 정책 검사, 감사, 드리프트와 장애 복구를 하나의 운영 가능한 시스템으로 연결한다.

## 학습 대상

- AWS의 VPC, IAM, EC2, S3를 사용해 본 클라우드 인프라 엔지니어
- Terraform 기초에서 운영 수준의 설계로 확장하려는 엔지니어
- 플랫폼 엔지니어 또는 DevOps 엔지니어 포트폴리오를 준비하는 사람

Linux, Git, 네트워크 기초가 부족하다면 과제 01을 시작하기 전에 명령행 사용, Git 브랜치와 Pull Request, CIDR과 라우팅을 먼저 복습한다.

## 완료 후 역량

과정을 완료하면 다음 작업을 설명하고 구현할 수 있어야 한다.

- AWS Organizations와 계정 격리 경계를 고려한 배포 구조 설계
- Organization, Account, Region, Availability Zone, VPC와 Subnet의 리소스 계층 설명
- 네트워크, 컴퓨팅, 데이터, 보안과 관측성으로 구성된 AWS 워크로드 아키텍처 설계
- 재사용 가능한 Terraform 모듈과 환경별 Root Module 구성
- 암호화, 버전 관리, 접근 제어와 잠금이 적용된 원격 State 운영
- Pull Request에서 Plan을 검토하고 승인된 변경만 Apply하는 파이프라인 구현
- OIDC와 STS를 이용해 정적 Access Key 없이 AWS에 배포
- 정적 분석과 Policy as Code를 이용한 보안 및 조직 정책 적용
- 배포 요청, 승인, 실행, 검증, 감사와 드리프트 탐지 자동화
- 삭제와 교체가 포함된 인프라 변경의 위험 및 복구 전략 설명

## 학습 디렉터리

| 순서 | 디렉터리 | 학습 결과 |
| --- | --- | --- |
| 01 | [AWS 리소스 구조](./01-aws-resource-structure/) | 리소스 범위와 장애 경계 |
| 02 | [VPC 네트워크](./02-vpc-networking/) | CIDR과 패킷 경로 설계 |
| 03 | [컴퓨팅과 트래픽](./03-compute-traffic/) | 컴퓨팅 및 확장 방식 선택 |
| 04 | [데이터와 저장소](./04-data-storage/) | 저장소와 복구 목표 설계 |
| 05 | [멀티 계정과 보안](./05-multi-account-security/) | 계정 및 권한 경계 설계 |
| 06 | [관측성과 Well Architected](./06-observability-well-architected/) | 운영 신호와 아키텍처 검토 |
| 07 | [Terraform 기본](./07-terraform-basics/) | VPC 코드와 Terraform 실행 |
| 08 | [Module과 원격 State](./08-modules-remote-state/) | 재사용 Module과 S3 Backend |
| 09 | [Pull Request Plan](./09-pr-plan-pipeline/) | 자동 Plan Pipeline |
| 10 | [OIDC Cross Account](./10-oidc-cross-account/) | 정적 키 없는 AWS 배포 |
| 11 | [테스트와 정책](./11-testing-policy-as-code/) | 배포 전 보안 및 정책 차단 |
| 12 | [배포 서비스 모델](./12-deployment-service-model/) | API와 비동기 Worker 설계 |
| 13 | [GitOps 승인과 Apply](./13-gitops-approval-apply/) | 승인된 Plan Apply |
| 14 | [감사 Drift 복구](./14-audit-drift-recovery/) | 추적, Drift와 장애 복구 |
| 15 | [최종 통합](./15-capstone-production-review/) | 운영 가능한 자동 배포 서비스 |

각 디렉터리의 `README.md`부터 읽는다. `research.md`에는 조사할 공식 자료와 질문이 있고, 나머지 파일은 직접 채우거나 실행하는 시작 파일이다.

## 지원 문서

| 문서 | 용도 |
| --- | --- |
| [작업 단위 커리큘럼](./01-curriculum.md) | 15개 과제의 전체 흐름 |
| [AWS 아키텍처 학습 가이드](./00-aws-architecture.md) | AWS 아키텍처 보충 설명 |
| [최종 프로젝트 명세](./02-capstone-project.md) | 자동 배포 서비스의 기능과 아키텍처 |
| [운영 준비 체크리스트](./checklists/production-readiness.md) | 최종 결과물 운영 검토 |
| [학습 기록 템플릿](./templates/study-log.md) | 작업별 진척도와 문제 해결 기록 |
| [공식 자료](./03-references.md) | AWS와 Terraform 공식 문서 모음 |

## 작업 단위 운영 방식

각 번호 디렉터리에서 다음 순환을 한 번 완료한다.

1. 선행 작업과 핵심 개념을 확인한다.
2. 아키텍처 또는 코드를 구현한다.
3. 정상 시나리오와 의도한 실패 시나리오를 검증한다.
4. 코드, 실행 증거와 설계 결정을 저장소에 남긴다.
5. 완료 기준을 모두 충족한 뒤 다음 작업으로 이동한다.

작업 크기는 학습자의 경험에 따라 달라질 수 있다. 단순히 명령이 한 번 성공한 것은 완료가 아니다. 다른 사람이 저장소를 받아 재현할 수 있고, 실패했을 때 원인을 찾을 수 있어야 한다.

## 권장 실습 환경

- 별도의 AWS Sandbox 계정
- `ap-northeast-2`를 기본 리전으로 사용
- Terraform 또는 OpenTofu 중 하나
- GitHub Actions 또는 조직에서 사용하는 동등한 CI 도구
- AWS CLI, Git, Docker, `jq`
- TFLint와 Checkov

실습 계정에는 예산 알림을 먼저 설정한다. 장시간 비용이 발생할 수 있는 NAT Gateway, RDS, EKS와 테스트 리소스는 실습이 끝난 뒤 제거하고 제거 여부를 확인한다.

## 최종 완료 조건

다음 흐름이 하나의 저장소에서 재현되면 과정을 완료한 것으로 본다.

```text
인프라 요청
  → 입력 검증
  → Pull Request 생성 또는 변경 제출
  → Terraform Plan
  → 보안과 정책 검사
  → 운영 승인
  → OIDC 기반 Apply
  → 배포 후 검증
  → 감사 로그 저장
  → 주기적 Drift 검사
```

최종 프로젝트는 [운영 준비 체크리스트](./checklists/production-readiness.md)의 필수 항목을 모두 충족해야 한다.

## 시작 순서

1. [01 AWS 리소스 구조](./01-aws-resource-structure/)의 `README.md`를 읽는다.
2. `research.md`의 자료를 조사하고 질문에 답한다.
3. 디렉터리에 준비된 문서와 코드를 완성한다.
4. 정상 및 실패 시나리오를 검증하고 완료 기준을 체크한다.
5. 변경 내용을 Commit한 뒤 다음 번호 디렉터리로 이동한다.
6. AWS 실습은 Sandbox 계정에서 수행하고 비용과 삭제 여부를 확인한다.
