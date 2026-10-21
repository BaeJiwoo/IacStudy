# AWS IaC 자동 배포 서비스 운영 준비 체크리스트

이 체크리스트는 최종 프로젝트를 운영 환경에 가까운 기준으로 검토하기 위한 것이다. `필수` 항목은 MVP 완료 조건이며, `확장` 항목은 조직 규모와 규제 요구에 따라 적용한다.

## 아키텍처와 소유권

- [ ] 필수 서비스의 사용자, 운영자와 보안 담당자가 정의돼 있다.
- [ ] 필수 Git, 데이터베이스와 AWS 중 무엇이 각 데이터의 원본인지 정의돼 있다.
- [ ] 필수 API 계층과 IaC 실행 계층이 분리돼 있다.
- [ ] 필수 계정, 리전, 환경과 Stack 또는 State의 매핑 규칙이 문서화돼 있다.
- [ ] 필수 Product, Module, Pipeline과 Policy의 소유 팀이 정의돼 있다.
- [ ] 확장 서비스 의존성과 장애 전파 경로가 문서화돼 있다.

## AWS 계정과 권한

- [ ] 필수 개발과 운영 워크로드가 별도 AWS 계정에 있다.
- [ ] 필수 사람의 접근과 자동화 역할이 분리돼 있다.
- [ ] 필수 CI는 OIDC와 STS 임시 자격 증명을 사용한다.
- [ ] 필수 Trust Policy가 조직, 저장소, 브랜치 또는 Environment를 제한한다.
- [ ] 필수 운영 역할에 최소 권한이 적용돼 있다.
- [ ] 필수 Role Session을 Request ID와 CI Run ID로 추적할 수 있다.
- [ ] 확장 Permission Boundary와 SCP가 최대 권한을 제한한다.
- [ ] 확장 비상 접근 역할의 사용과 사후 검토 절차가 있다.

## CloudFormation과 Terraform 상태

- [ ] 필수 CloudFormation Stack, Change Set, Event와 Drift 조회 절차가 있다.
- [ ] 필수 Stack Policy, Termination Protection과 Retain Resource의 적용 기준이 있다.
- [ ] 필수 Rollback 실패와 StackSets 부분 실패 Runbook이 있다.

- [ ] 필수 State가 로컬 또는 Git이 아닌 원격 Backend에 저장된다.
- [ ] 필수 S3 Server Side Encryption과 Versioning이 활성화돼 있다.
- [ ] 필수 State 잠금이 활성화돼 있다.
- [ ] 필수 개발과 운영 State 및 권한이 분리돼 있다.
- [ ] 필수 State 읽기와 쓰기 권한이 필요한 역할로 제한돼 있다.
- [ ] 필수 State 복구 절차가 실제로 검증됐다.
- [ ] 필수 Force Unlock 전 확인 절차가 Runbook에 있다.
- [ ] 확장 State Bucket 삭제와 KMS Key 삭제에 추가 보호가 있다.

## Product Module과 버전

- [ ] 필수 CloudFormation Product 또는 Template의 입력, 출력과 예제가 문서화돼 있다.
- [ ] 필수 Template을 `cfn-lint`와 Guard로 검사한다.
- [ ] 필수 Module 입력, 출력, 기본값과 예제가 문서화돼 있다.
- [ ] 필수 Module과 Provider 버전이 고정돼 있다.
- [ ] 필수 Module에 입력 Validation과 주요 Preconditions가 있다.
- [ ] 필수 조직의 필수 태그가 공통 적용된다.
- [ ] 필수 Module 버전 변경에 Changelog가 있다.
- [ ] 확장 Product 및 Module 버전 승격과 폐기 정책이 있다.

## Change Preview와 실행

- [ ] 필수 Pull Request에서 Change Set 또는 Plan을 확인할 수 있다.
- [ ] 필수 생성, 변경, 교체와 삭제가 구분돼 표시된다.
- [ ] 필수 승인된 Commit과 Apply Commit이 일치한다.
- [ ] 필수 승인된 Change Preview와 실행 대상의 Digest가 일치한다.
- [ ] 필수 운영 Apply에는 요청자 외의 승인이 필요하다.
- [ ] 필수 동일 Stack 또는 State에 대한 실행이 직렬화된다.
- [ ] 필수 실행 후 실제 리소스 검증이 수행된다.
- [ ] 필수 Change Preview와 실행 로그의 보존 기간이 정해져 있다.
- [ ] 확장 배포 가능 시간과 변경 동결 기간이 적용된다.

## 보안과 정책

- [ ] 필수 `fmt`, `validate`, lint와 보안 검사가 자동 실행된다.
- [ ] 필수 공개 저장소와 공개 관리 포트가 차단된다.
- [ ] 필수 암호화와 필수 태그 누락이 차단된다.
- [ ] 필수 허용 계정, 리전과 Module 버전을 검증한다.
- [ ] 필수 사용자 입력이 Shell 명령이나 파일 경로로 직접 실행되지 않는다.
- [ ] 필수 Secret, State와 전체 Change Preview가 로그에 출력되지 않는다.
- [ ] 필수 운영 삭제와 교체에 추가 검토가 있다.
- [ ] 확장 정책 예외에 담당자, 사유와 만료일이 있다.
- [ ] 확장 Container Image와 의존성 취약점 검사도 수행한다.

## 신뢰성과 복구

- [ ] 필수 Idempotency Key로 중복 요청을 차단한다.
- [ ] 필수 Worker 중단 후 실행 상태를 복구할 수 있다.
- [ ] 필수 재시도 가능 오류와 수동 확인 오류를 구분한다.
- [ ] 필수 부분 실패 후 Stack 또는 State와 실제 리소스를 확인하는 Runbook이 있다.
- [ ] 필수 데이터 리소스 삭제 전에 Backup 또는 Snapshot을 확인한다.
- [ ] 필수 비상 수동 변경을 IaC에 역반영하는 절차가 있다.
- [ ] 확장 요청 Queue의 Dead Letter Queue와 재처리 절차가 있다.
- [ ] 확장 목표 복구 시간과 허용 가능한 데이터 손실이 정의돼 있다.

## 로그와 감사

- [ ] 필수 모든 단계에서 같은 Request ID를 사용한다.
- [ ] 필수 로그에 Commit SHA, Account ID, Region, 실행 대상과 Artifact Version이 있다.
- [ ] 필수 요청자, 승인자와 실행 역할이 기록된다.
- [ ] 필수 CloudTrail에서 배포 API 호출을 추적할 수 있다.
- [ ] 필수 감사 기록이 일반 애플리케이션 로그와 분리돼 있다.
- [ ] 필수 감사 기록의 변경과 삭제 권한이 제한돼 있다.
- [ ] 확장 중앙 Log Archive 계정에 로그를 보존한다.

## 관측성과 Drift

- [ ] 필수 배포 성공률과 실패 단계가 측정된다.
- [ ] 필수 실행 시간과 승인 대기 시간이 측정된다.
- [ ] 필수 Queue 지연과 Worker 오류가 경보 대상이다.
- [ ] 필수 CloudFormation과 Terraform의 정기 Drift 검사가 실행된다.
- [ ] 필수 Drift 발견 시 담당 팀에 알림이 전송된다.
- [ ] 필수 코드 반영과 원상 복구 중 선택 기준이 있다.
- [ ] 확장 계정 및 Module별 변경 실패율과 복구 시간을 추적한다.

## 비용과 수명 주기

- [ ] 필수 실습 및 개발 계정에 Budget 알림이 있다.
- [ ] 필수 리소스에 Owner와 Cost Center 태그가 있다.
- [ ] 필수 비용이 큰 리소스와 수량 증가를 Change Preview에서 식별한다.
- [ ] 필수 임시 환경에 만료 시간과 정리 작업이 있다.
- [ ] 필수 서비스 제거와 잔여 리소스 확인 절차가 있다.
- [ ] 확장 배포 전 비용 예상과 임계값 승인이 있다.

## 문서와 운영 절차

- [ ] 필수 신규 사용자가 README만으로 개발 배포를 재현할 수 있다.
- [ ] 필수 아키텍처와 주요 설계 결정이 기록돼 있다.
- [ ] 필수 Stack 또는 State 장애, 실행 실패, OIDC 실패와 Drift Runbook이 있다.
- [ ] 필수 Product, Module과 Policy 변경 절차가 문서화돼 있다.
- [ ] 필수 알려진 제한과 지원하지 않는 사용 사례가 명시돼 있다.
- [ ] 확장 정기 장애 훈련 일정과 개선 항목 관리 절차가 있다.
