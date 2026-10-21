# 배포 서비스 데이터 모델

| 필드 | 타입 | 생성 주체 | 변경 가능 여부 | 설명 |
| --- | --- | --- | --- | --- |
| request_id | String | API | 아니요 | 전체 흐름 식별자 |
| idempotency_key | String | Client | 아니요 | 중복 요청 방지 |
| project | String | Client | 아니요 | 소유권과 비용 단위 |
| account_id | String | Client와 Catalog | 아니요 | 대상 AWS 계정 |
| region | String | Client와 Catalog | 아니요 | 대상 Region |
| state_key | String | Service | 아니요 | Terraform State 식별자 |
| commit_sha | String | Git Integration | 조건부 | 검토 대상 Commit |
| plan_digest | String | Plan Worker | 아니요 | 승인한 Plan Hash |
| requester | String | Identity Provider | 아니요 | 요청자 |
| approver | String | Approval System | 예 | 승인자 |
| status | Enum | Workflow | 예 | 현재 상태 |
| run_id | String | Worker | 예 | 개별 실행 ID |
| error | Object | Worker | 예 | 실패 단계와 원인 |

## 잠금 키

- Idempotency Key 저장 조건:
- 실행 잠금 키:
- 잠금 만료 방식:
- 오래된 잠금 확인 절차:

## 데이터 원본

| 데이터 | 원본 | 복구 방법 |
| --- | --- | --- |
| 원하는 인프라 상태 |  |  |
| 실제 리소스 연결 |  |  |
| 배포 요청 상태 |  |  |
| 승인 기록 |  |  |
| 감사 이벤트 |  |  |
