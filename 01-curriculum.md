# AWS IaC 자동 배포 서비스 작업 단위 커리큘럼

이 커리큘럼은 AWS 아키텍처 지식을 안전한 자동 배포 플랫폼으로 연결한다. 달력이나 주차가 아니라 선행 작업, 산출물과 완료 기준으로 진척도를 판단한다. 경험이 있는 작업은 완료 기준을 바로 검증해 통과할 수 있고, 부족한 작업만 수행하면 된다.

## 작업 흐름

| 작업 ID | 작업 | 선행 작업 | 핵심 산출물 |
| --- | --- | --- | --- |
| ARCH 01부터 07 | AWS 구조와 워크로드 아키텍처 | 없음 | AWS 아키텍처와 IaC 경계 매핑 |
| FOUND 01 | AWS 멀티 계정과 Landing Zone | ARCH 05 | 계정 및 권한 아키텍처 |
| IAC 01 | Terraform 기본 동작 | ARCH 07 | VPC Root Module과 Plan |
| IAC 02 | Module과 원격 State | IAC 01 | 재사용 Module과 S3 Backend |
| PIPE 01 | Pull Request 기반 CI | IAC 02 | 자동 Plan Workflow |
| SEC 01 | OIDC와 Cross Account 배포 | FOUND 01, PIPE 01 | 정적 키 없는 배포 역할 |
| GOV 01 | 테스트와 Policy as Code | IAC 02, PIPE 01 | 테스트 및 보안 정책 Pipeline |
| PLAT 01 | 배포 서비스 도메인 설계 | SEC 01, GOV 01 | API와 상태 모델, 실행 Worker |
| PLAT 02 | GitOps 승인과 Apply | PLAT 01 | 승인된 Plan Apply 흐름 |
| OPS 01 | 관측성과 감사 | PLAT 02 | 실행 추적, 로그, Drift 탐지 |
| OPS 02 | 장애 복구와 비용 통제 | OPS 01 | 실패 시나리오와 Runbook |
| CAP 01 | 최종 프로젝트 통합 | OPS 02 | End to End MVP |
| CAP 02 | 운영 검토와 포트폴리오 | CAP 01 | 운영 체크리스트와 시연 자료 |

AWS 아키텍처 작업은 [AWS 아키텍처 학습 가이드](./00-aws-architecture.md)에 정의돼 있다. ARCH 01부터 ARCH 07을 완료하면 이 문서의 자동 배포 서비스 작업으로 이동한다.

# 기반 구조

## FOUND 01 AWS 멀티 계정과 Landing Zone

### 선행 작업

- ARCH 05 멀티 계정과 보안 구조

### 학습 목표

- AWS 계정을 리소스 격리와 장애 영향 범위의 경계로 설명한다.
- Management, Security, Log Archive, Shared Services, Development, Production 계정의 책임을 구분한다.
- IAM Identity Center, AWS Organizations, OU, SCP의 관계를 이해한다.
- 사람의 접근 권한과 자동화 워크로드의 권한을 분리한다.

### 실습

- 가상의 조직을 위한 계정과 OU 구조를 설계한다.
- 개발 및 운영 계정에 배포 역할을 정의한다.
- 운영 배포 역할에 적용할 최소 권한과 신뢰 정책을 작성한다.
- 계정별 CloudTrail과 중앙 로그 수집 경로를 설계한다.

### 산출물

- `docs/account-architecture.md`
- 계정과 역할 관계 다이어그램
- 개발 및 운영 권한 매트릭스

### 완료 기준

- Management 계정에서 애플리케이션 워크로드를 실행하지 않는 이유를 설명할 수 있다.
- SCP가 IAM 권한을 직접 부여하는 정책이 아니라 최대 권한 경계를 제한하는 정책임을 설명할 수 있다.
- 운영 계정의 직접 콘솔 변경을 줄이기 위한 통제를 제시할 수 있다.

## IAC 01 Terraform 기본 동작

### 선행 작업

- ARCH 07 Well Architected 설계 검토

### 학습 목표

- Provider, Resource, Data Source, Variable, Local, Output의 역할을 구분한다.
- `init`, `fmt`, `validate`, `plan`, `apply`, `destroy`의 실행 순서를 이해한다.
- Terraform이 구성 코드와 실제 리소스, State를 비교하는 방식을 설명한다.
- Provider와 Module 버전을 고정해야 하는 이유를 이해한다.

### 실습

- 2개 Availability Zone을 사용하는 VPC를 작성한다.
- Public 및 Private Subnet, Route Table, Security Group을 추가한다.
- 변수 검증과 주요 Output을 작성한다.
- 변경 전후 Plan에서 생성, 변경, 교체, 삭제를 구분한다.

### 산출물

- 실행 가능한 VPC Root Module
- `.terraform.lock.hcl`
- Plan 변경 해설 문서

### 완료 기준

- 코드 변경이 왜 리소스 교체를 유발하는지 Plan을 근거로 설명할 수 있다.
- State 파일을 Git에 커밋하면 안 되는 이유를 설명할 수 있다.
- `sensitive = true`가 State 자체에서 비밀 값을 제거하지 않는다는 점을 이해한다.

## IAC 02 Module과 원격 State

### 선행 작업

- IAC 01

### 학습 목표

- 재사용 Module과 환경별 Root Module의 책임을 분리한다.
- State를 계정, 환경, 시스템 단위로 나누는 기준을 세운다.
- S3 암호화, Versioning, 접근 제어와 State Locking을 구성한다.
- Module의 하위 호환성과 버전 정책을 정의한다.

### 실습

- IAC 01에서 작성한 VPC를 재사용 가능한 Module로 분리한다.
- 개발 환경 Root Module에서 고정 버전으로 Module을 호출한다.
- KMS 암호화와 Versioning이 적용된 S3 Backend를 구성한다.
- `use_lockfile = true`로 동시에 실행되는 Apply를 차단한다.

### 산출물

- `modules/vpc`
- `environments/dev/network`
- State 경로와 권한 설계 문서
- Module README와 입력 및 출력 표

### 완료 기준

- State 분리 단위가 지나치게 크거나 작을 때 발생하는 문제를 비교할 수 있다.
- State를 잃었을 때와 State 잠금이 남았을 때의 대응 절차를 설명할 수 있다.
- 운영 State 읽기 권한도 제한해야 하는 이유를 설명할 수 있다.

# 배포 파이프라인

## PIPE 01 Pull Request 기반 CI

### 선행 작업

- IAC 02

### 학습 목표

- Plan과 Apply를 분리하고 Pull Request에 변경 내용을 제공한다.
- 동일한 Commit과 환경에서 생성된 Plan을 추적한다.
- CI 실패가 사용자에게 수정 가능한 메시지를 제공하도록 설계한다.
- Pipeline 파일도 코드 검토 대상으로 관리한다.

### 실습

- Pull Request에서 `fmt`, `validate`, TFLint를 실행한다.
- Terraform Plan을 생성하고 사람이 읽을 수 있는 요약을 남긴다.
- Plan 파일과 JSON 출력의 저장 위치, 암호화, 보존 기간을 정한다.
- 같은 State를 대상으로 한 동시 실행을 차단한다.

### 산출물

- Pull Request Plan 워크플로
- 성공과 실패 실행 증거
- Pipeline 단계와 실패 처리 문서

### 완료 기준

- 검토한 Plan과 실제 Apply 대상이 달라지는 상황을 방지할 수 있다.
- Fork 또는 신뢰하지 않는 Pull Request에 AWS 권한을 부여하면 안 되는 이유를 설명할 수 있다.
- Plan 아티팩트가 민감 정보로 취급되어야 하는 이유를 설명할 수 있다.

## SEC 01 OIDC와 Cross Account 배포

### 선행 작업

- FOUND 01
- PIPE 01

### 학습 목표

- 장기 Access Key 대신 OIDC와 STS 임시 자격 증명을 사용한다.
- CI 시스템 역할과 대상 계정 배포 역할을 분리한다.
- Trust Policy와 Permission Policy의 차이를 이해한다.
- Repository, Branch, Environment 조건으로 역할 인수를 제한한다.

### 실습

- GitHub Actions 또는 사용하는 CI를 AWS OIDC Provider와 연결한다.
- 개발 계정과 운영 계정에 서로 다른 배포 역할을 만든다.
- 허용되지 않은 브랜치에서 역할 인수가 실패하는지 검증한다.
- CloudTrail에서 역할 인수와 배포 API 호출을 추적한다.

### 산출물

- OIDC Provider와 배포 역할 IaC
- 역할 신뢰 관계 다이어그램
- 허용 및 거부 테스트 결과

### 완료 기준

- CI Secret에 AWS Access Key가 존재하지 않는다.
- 각 실행을 Commit SHA와 CI Run ID로 CloudTrail에서 추적할 수 있다.
- 운영 배포 역할은 승인 조건을 충족한 워크플로만 인수할 수 있다.

## GOV 01 테스트와 Policy as Code

### 선행 작업

- IAC 02
- PIPE 01

### 학습 목표

- 구문 검사, 정적 분석, Module 테스트, 통합 테스트의 역할을 구분한다.
- Plan JSON을 이용해 배포 전 정책을 검사한다.
- 예방 통제와 탐지 통제를 함께 설계한다.
- 예외 정책에 담당자, 사유와 만료일을 부여한다.

### 실습

- `terraform test`로 Module 입력과 출력 조건을 검증한다.
- Checkov로 공개 S3, 과도한 Security Group, 암호화 누락을 차단한다.
- 필수 태그, 허용 리전, 운영 삭제 금지 정책을 작성한다.
- 잘못된 코드가 어떤 단계에서 차단되는지 실패 테스트를 작성한다.

### 산출물

- Module 테스트
- 보안 검사 구성
- 최소 3개의 조직 정책과 정책 테스트
- 정책 예외 양식

### 완료 기준

- 각 정책 실패 메시지가 수정 방법을 안내한다.
- 실제 리소스를 생성하는 테스트는 전용 계정에서 실행하고 정리 여부를 확인한다.
- 경고 정책과 배포 차단 정책을 위험도에 따라 구분한다.

# 플랫폼 구현

## PLAT 01 배포 서비스 도메인 설계

### 선행 작업

- SEC 01
- GOV 01

### 학습 목표

- 배포 요청, Plan, 승인, 실행과 검증을 독립된 상태로 모델링한다.
- API 계층과 Terraform 실행 워커를 분리한다.
- 중복 요청과 동시 실행을 제어한다.
- Git과 데이터베이스가 각각 어떤 정보의 원본인지 정의한다.

### 실습

- 배포 요청 API의 입력 스키마를 작성한다.
- 요청 상태 전이와 실패 상태를 설계한다.
- `request_id`, `commit_sha`, `account_id`, `state_key`를 포함한 실행 메타데이터를 저장한다.
- SQS와 CodeBuild 또는 ECS Task 기반 실행 워커의 최소 기능을 만든다.

### 산출물

- API 계약
- 상태 전이 다이어그램
- Deployment Request 데이터 모델
- 비동기 실행 워커 Proof of Concept

### 완료 기준

- 동일 Idempotency Key의 중복 요청이 두 번 Apply되지 않는다.
- 한 State에 대한 Apply가 동시에 두 개 실행되지 않는다.
- 서비스가 재시작돼도 실행 상태를 복원할 수 있다.

## PLAT 02 GitOps 승인과 Apply

### 선행 작업

- PLAT 01

### 학습 목표

- 서비스 요청을 Git 변경과 연결한다.
- 비운영 및 운영 환경의 승인 정책을 다르게 구성한다.
- 승인된 Commit과 Plan만 Apply한다.
- 승인 이후 코드나 환경이 변경되면 승인을 무효화한다.

### 실습

- YAML 요청을 Terraform 변수로 변환한다.
- 요청으로 Pull Request를 생성하거나 기존 Pull Request에 변경을 추가한다.
- CODEOWNERS 또는 Environment Approval을 적용한다.
- Apply 후 실제 AWS 리소스를 검증하고 결과를 요청 상태에 기록한다.

### 산출물

- 요청 예제와 입력 스키마
- GitOps 변환 로직
- 승인 및 Apply 워크플로
- End to End 실행 영상 또는 로그

### 완료 기준

- 운영 Apply에는 요청자 이외의 승인자가 필요하다.
- 승인 후 Commit이 바뀌면 새로운 Plan과 승인이 필요하다.
- Apply 실패 시 실패 단계와 수정 가능한 오류 정보가 남는다.

## OPS 01 관측성과 감사

### 선행 작업

- PLAT 02

### 학습 목표

- 하나의 요청을 API, 큐, 워커, CI와 AWS API까지 추적한다.
- 기술 로그와 감사 로그를 구분한다.
- IaC 밖에서 발생한 변경을 Drift로 탐지한다.
- 배포 서비스의 서비스 수준 지표를 정의한다.

### 실습

- 구조화 로그에 Request ID, Run ID, Commit SHA를 포함한다.
- 배포 성공률, 실행 시간, 승인 대기 시간과 실패 단계를 지표화한다.
- 의도적으로 콘솔에서 변경을 만들고 Drift를 탐지한다.
- 운영 변경과 수동 변경을 구분해 알림을 보낸다.

### 산출물

- CloudWatch Dashboard
- 감사 이벤트 스키마
- Drift 탐지 작업
- 운영 알림 기준

### 완료 기준

- 특정 AWS 리소스가 어떤 요청과 Commit으로 생성됐는지 찾을 수 있다.
- 로그에 Secret, Token, 전체 State 또는 전체 Plan이 노출되지 않는다.
- Drift가 발견됐을 때 코드 반영과 원상 복구 중 어떤 조치를 할지 판단 기준이 있다.

# 운영 검증

## OPS 02 장애 복구와 비용 통제

### 선행 작업

- OPS 01

### 학습 목표

- 인프라 변경에는 항상 자동 롤백이 가능한 것은 아님을 이해한다.
- State 손상, 잠금 잔류, 부분 Apply와 자격 증명 만료에 대응한다.
- 삭제와 교체가 포함된 변경에 추가 보호 장치를 적용한다.
- 배포 전후 비용 변화를 확인한다.

### 실습

- Apply 중 워커 종료와 재시도를 실험한다.
- State Versioning을 이용한 복구 절차를 연습한다.
- `prevent_destroy`, Deletion Protection, Snapshot 확인 단계를 추가한다.
- 비용이 큰 리소스와 예상하지 못한 수량 증가를 정책으로 탐지한다.

### 산출물

- 장애 시나리오별 Runbook
- State 복구 실습 기록
- 운영 삭제 승인 절차
- 비용 통제 정책

### 완료 기준

- 실패한 Apply를 무조건 재실행하지 않고 State와 실제 리소스를 먼저 확인한다.
- 데이터 리소스의 삭제와 교체에는 백업 및 복구 확인 단계가 존재한다.
- 비상 수동 변경 후 IaC 코드로 역반영하는 절차가 있다.

## CAP 01 최종 프로젝트 통합

### 선행 작업

- OPS 02

### 학습 목표

- 선행 작업의 기능을 하나의 End to End 서비스로 연결한다.
- Happy Path뿐 아니라 거부, 실패와 재시도 흐름을 검증한다.
- 설치와 실행 절차를 다른 사람이 재현할 수 있게 문서화한다.

### 실습

- [최종 프로젝트 명세](./02-capstone-project.md)의 MVP를 구현한다.
- 개발 및 운영 환경의 배포 정책 차이를 적용한다.
- 정상 배포, 정책 거부, 승인 거부, Apply 실패, Drift를 시연한다.
- 리소스를 제거하고 State 및 로그가 정상적으로 정리되는지 확인한다.

### 산출물

- 실행 가능한 프로젝트 저장소
- 아키텍처 문서
- 시연 스크립트
- 알려진 제한과 향후 개선 목록

### 완료 기준

- 신규 사용자가 README만으로 개발 환경 배포를 재현할 수 있다.
- 모든 실행 단계가 같은 Request ID로 추적된다.
- 보안 검사나 승인을 우회하는 경로가 없다.

## CAP 02 운영 검토와 포트폴리오

### 선행 작업

- CAP 01

### 학습 목표

- 설계 선택과 Trade Off를 명확하게 설명한다.
- 운영 준비 상태를 체크리스트로 검증한다.
- 문제 상황을 중심으로 기술 면접 답변과 프로젝트 시연을 준비한다.

### 실습

- [운영 준비 체크리스트](./checklists/production-readiness.md)를 수행한다.
- 10분 시연과 5분 장애 대응 시연을 준비한다.
- Terraform, CloudFormation과 CDK의 선택 기준을 정리한다.
- 보안, 안정성, 비용, 운영 복잡성의 개선 우선순위를 작성한다.

### 산출물

- 최종 README
- 아키텍처 결정 기록
- 운영 Runbook
- 시연 자료와 면접용 프로젝트 설명

### 완료 기준

- 설계의 장점뿐 아니라 한계와 대안을 설명할 수 있다.
- 운영 체크리스트의 필수 항목을 모두 충족한다.
- 서비스 장애와 배포 실패를 구분하고 각각의 대응 절차를 설명할 수 있다.
