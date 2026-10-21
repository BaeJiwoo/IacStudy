# Terraform Apply 실패 Runbook

## 적용 조건

- 경보 또는 사용자 증상:
- 대상 환경:
- 담당 팀:

## 즉시 확인

1. Request ID와 Run ID를 확인한다.
2. 대상 Commit SHA, Plan Digest, Account, Region과 State Key를 확인한다.
3. 다른 Apply가 실행 중인지 확인한다.
4. Terraform State와 실제 AWS 리소스를 비교한다.
5. 마지막 성공 단계와 실패 API를 확인한다.

## 재시도 판단

- 재시도 가능한 조건:
- 재시도하면 안 되는 조건:
- 사람의 승인이 필요한 조건:

## 복구

- 실행한 명령:
- 수동 변경:
- 데이터 영향:
- 검증 결과:

## 사후 작업

- 코드 역반영:
- 원인:
- 재발 방지:
- Runbook 개선:
