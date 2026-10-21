# 검증 시나리오

## 정상 시나리오

- 동일 Idempotency Key 재요청이 기존 Deployment를 반환한다.
- 서로 다른 State 대상 요청은 병렬 실행되고 같은 대상 요청은 직렬화된다.

## 실패 시나리오

- Worker 종료 후 Lease 만료와 Reconciliation으로 상태를 복구한다.
- 악의적인 Module 경로나 Shell 입력이 Schema 및 Allowlist에서 차단된다.

각 시나리오는 입력, 기대 상태 전이, 실제 결과, 감사 Event와 복구 결과를 포함한다.
