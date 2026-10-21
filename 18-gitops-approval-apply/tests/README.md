# 검증 시나리오

## 정상 시나리오

- 승인된 동일 Commit과 Plan Artifact만 대상 Account에 적용된다.
- 배포 후 실제 Resource 속성과 Health를 검증하고 상태를 기록한다.

## 실패 시나리오

- 승인 뒤 Commit 또는 Artifact가 바뀌면 Apply가 거부돼야 한다.
- 요청자 본인이 Production 단독 승인자가 되는 흐름을 차단해야 한다.

각 시나리오는 입력, 기대 상태 전이, 실제 결과, 감사 Event와 복구 결과를 포함한다.
