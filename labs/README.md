# AWS IaC 핵심 실습 가이드

각 실습은 작업 단위 커리큘럼의 개념을 독립적으로 검증한다. 실습은 별도 Sandbox 계정에서 수행하고, 성공 로그뿐 아니라 의도한 실패가 올바른 단계에서 발생하는지도 기록한다. AWS 구조와 아키텍처 실습은 [AWS 아키텍처 학습 가이드](../00-aws-architecture.md)를 먼저 사용한다.

## 공통 안전 규칙

- 실습 전에 AWS Budget과 알림을 설정한다.
- 개인 또는 운영 계정에서 실습하지 않는다.
- Access Key를 Git과 CI Secret에 저장하지 않는다.
- State와 Plan 파일을 Git에 커밋하지 않는다.
- 민감한 값이 로그와 Pull Request에 노출되지 않았는지 확인한다.
- 실습 종료 후 리소스를 삭제하고 AWS Console 또는 CLI로 삭제 여부를 재확인한다.
- NAT Gateway, RDS, EKS, Load Balancer처럼 시간당 비용이 발생하는 리소스를 우선 확인한다.

## Lab 1 멀티 계정 권한 설계

### 목표

개발과 운영 계정에 서로 다른 배포 역할을 정의하고 사람의 권한과 자동화 권한을 분리한다.

### 작업

1. OU와 계정 구조를 그린다.
2. CI 역할과 대상 계정 배포 역할의 Trust 관계를 정의한다.
3. 운영 배포에서 허용할 서비스와 API를 정한다.
4. 금지 리전과 Root 사용 제한을 포함한 Guardrail을 설계한다.

### 증거

- 계정 다이어그램
- 권한 매트릭스
- Trust Policy 예제
- 예상 허용 및 거부 시나리오

## Lab 2 재사용 가능한 VPC Module

### 목표

환경별 코드 중복 없이 VPC를 배포하는 Module을 만든다.

### 작업

1. 2개 Availability Zone과 Public 및 Private Subnet을 만든다.
2. CIDR, NAT Gateway 수, 태그를 입력으로 받는다.
3. CIDR과 환경 이름에 Validation을 추가한다.
4. VPC ID와 Subnet ID를 출력한다.
5. 개발 환경 Root Module에서 고정 버전으로 호출한다.

### 증거

- Module 코드와 README
- 정상 및 잘못된 입력 테스트
- Plan 요약
- `terraform destroy` 결과

## Lab 3 안전한 원격 State

### 목표

S3 Backend에 암호화, Versioning, 접근 제어와 잠금을 적용한다.

### 작업

1. State 전용 S3 Bucket과 KMS Key를 만든다.
2. Public Access Block과 Versioning을 활성화한다.
3. `use_lockfile = true`를 설정한다.
4. 개발 및 운영 State 경로와 권한을 분리한다.
5. 두 실행을 동시에 시작해 잠금 동작을 검증한다.
6. 이전 S3 Object Version에서 복구하는 절차를 연습한다.

### 증거

- Backend 구성
- Bucket과 KMS 정책
- 잠금 충돌 로그
- State 복구 Runbook

## Lab 4 Pull Request Plan

### 목표

코드 변경마다 자동 검증과 Plan을 실행하고 검토자가 위험을 판단할 수 있는 요약을 제공한다.

### 작업

1. `fmt`, `validate`, lint 단계를 구성한다.
2. Plan 파일과 JSON을 생성한다.
3. 생성, 변경, 교체, 삭제 수를 Pull Request에 표시한다.
4. Plan 아티팩트의 암호화와 보존 기간을 설정한다.
5. 변경된 환경만 실행하도록 경로 필터를 적용한다.

### 증거

- CI 워크플로
- 안전한 변경과 삭제 변경의 Plan 비교
- 실패 메시지 화면 또는 로그

## Lab 5 OIDC 기반 Cross Account Apply

### 목표

정적 자격 증명 없이 CI가 대상 계정 역할을 인수해 Apply한다.

### 작업

1. AWS에 CI OIDC Provider를 등록한다.
2. Repository와 Branch가 제한된 CI 역할을 만든다.
3. 개발 및 운영 계정의 배포 역할을 만든다.
4. 허용 브랜치에서 Apply한다.
5. 허용되지 않은 브랜치와 저장소에서 역할 인수를 시도한다.
6. CloudTrail에서 Role Session과 API 호출을 확인한다.

### 증거

- OIDC와 IAM IaC
- 허용 및 거부 로그
- CloudTrail 조회 결과

## Lab 6 테스트와 정책 차단

### 목표

잘못된 인프라가 AWS에 생성되기 전에 Pipeline에서 차단되게 한다.

### 작업

1. Module 입력과 리소스 조건을 `terraform test`로 검증한다.
2. 공개 S3 Bucket을 차단한다.
3. SSH 또는 RDP의 전체 인터넷 공개를 차단한다.
4. 필수 태그 누락을 차단한다.
5. 운영 Plan에서 리소스 삭제를 별도 승인 대상으로 표시한다.

### 증거

- 테스트와 정책 코드
- 정책별 통과 및 실패 사례
- 사용자가 수정할 수 있는 오류 메시지

## Lab 7 비동기 배포 워커

### 목표

API 요청과 Terraform 실행을 분리하고 중복 및 동시 실행을 제어한다.

### 작업

1. 요청 API와 입력 스키마를 만든다.
2. 요청을 Queue에 기록하고 Worker가 처리하게 한다.
3. Idempotency Key로 중복 요청을 차단한다.
4. 대상 `account_id`, `region`, `state_key` 단위 잠금을 구현한다.
5. Worker 중단 뒤 요청 상태가 복원되는지 확인한다.

### 증거

- API 계약
- 상태 전이 로그
- 중복 요청 및 동시 실행 테스트
- Worker 장애 복구 결과

## Lab 8 승인된 Plan Apply

### 목표

검토자가 승인한 Commit과 Plan만 운영 환경에 배포한다.

### 작업

1. Plan의 Commit SHA와 Digest를 저장한다.
2. 운영 Environment에 승인자를 설정한다.
3. 승인 뒤 Commit을 변경해 Apply가 거부되는지 확인한다.
4. 승인된 Plan을 Apply하고 사후 검증을 수행한다.
5. 요청자와 승인자가 같은 경우를 거부한다.

### 증거

- 승인 규칙
- 정상 Apply 로그
- Commit 또는 Plan 불일치 거부 로그

## Lab 9 Drift 탐지와 감사 추적

### 목표

IaC 밖의 변경을 탐지하고 리소스를 생성한 요청까지 역추적한다.

### 작업

1. AWS Console에서 관리 중인 리소스를 의도적으로 변경한다.
2. 정기 Drift 작업으로 변경을 탐지한다.
3. Request ID, Commit SHA, State Key와 CloudTrail Event를 연결한다.
4. 코드 반영 또는 원상 복구 절차를 수행한다.

### 증거

- Drift 실행 결과
- 경고 메시지
- 리소스부터 요청까지의 추적 과정
- 조치 기록

## Lab 10 실패 복구 훈련

### 목표

실패한 Apply를 안전하게 진단하고 State와 실제 리소스를 일치시킨다.

### 작업

1. Apply 중 Worker를 중단한다.
2. 자격 증명 만료와 API Throttling을 모의한다.
3. 남은 Lock과 부분 생성 리소스를 확인한다.
4. State를 먼저 확인한 뒤 재시도 또는 수동 조치를 선택한다.
5. 데이터 리소스 삭제 전 Snapshot 확인 절차를 수행한다.

### 증거

- 장애 타임라인
- 원인과 영향 범위
- 실행한 복구 절차
- 재발 방지 항목
