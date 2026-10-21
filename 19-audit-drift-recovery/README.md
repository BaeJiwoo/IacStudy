# 과제 19 감사 Drift 장애 복구와 비용

배포 요청부터 AWS API 호출까지 추적하고, IaC 밖의 변경과 실패한 Apply를 안전하게 처리한다.

## 선행 과제

- `18-gitops-approval-apply`

## 시작 파일

- [starter/drift-check.sh](./starter/drift-check.sh): Terraform Plan Exit Code 기반 Drift 확인
- [metrics.md](./metrics.md): 배포 서비스 지표
- [failure-experiments.md](./failure-experiments.md): 장애 실험 계획
- [runbooks/apply-failure.md](./runbooks/apply-failure.md): Apply 실패 Runbook
- [runbooks/state-recovery.md](./runbooks/state-recovery.md): State 복구 Runbook

## 과제

1. [research.md](./research.md)에서 CloudTrail, Config와 Drift를 조사한다.
2. 모든 로그에 Request ID, Run ID, Commit SHA, Account ID와 State Key를 기록한다.
3. Console에서 의도적으로 변경하고 Drift 작업으로 탐지한다.
4. Worker 중단, 자격 증명 만료, 잠금 잔류와 부분 Apply를 실험한다.
5. State Versioning을 이용한 복구 절차를 검증한다.
6. 비용이 큰 리소스와 예상하지 못한 수량 증가를 Plan에서 식별한다.

CloudFormation Stack Drift와 Terraform Plan Drift를 모두 비교한다. 과제별 용어, 제출 형식과 검증 항목은 [keywords.md](./keywords.md), [assignment.md](./assignment.md), [tests/README.md](./tests/README.md)와 [checklist.md](./checklist.md)를 함께 사용한다.

## 완료 기준

- [ ] 특정 리소스를 요청과 Commit까지 역추적할 수 있다.
- [ ] Drift 발견 후 코드 반영과 원상 복구 중 선택 기준이 있다.
- [ ] 실패한 Apply를 무조건 재시도하지 않고 State와 실제 리소스를 먼저 확인한다.
- [ ] 데이터 리소스 삭제 전에 Backup과 복원 가능성을 확인한다.
- [ ] 배포 성공률, 실행 시간, 승인 대기 시간과 실패 단계를 측정한다.
- [ ] 실습 종료 후 비용 발생 리소스가 남지 않았다.
