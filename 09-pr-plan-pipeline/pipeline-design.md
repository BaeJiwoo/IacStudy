# Terraform Pipeline 설계

| 단계 | 입력 | 검증 또는 작업 | 출력 | 실패 시 조치 |
| --- | --- | --- | --- | --- |
| Checkout | Commit SHA |  |  |  |
| Format | HCL |  |  |  |
| Validate | HCL |  |  |  |
| Test | Module |  |  |  |
| Security | HCL |  |  |  |
| Plan | State와 HCL |  |  |  |
| Policy | Plan JSON |  |  |  |
| Approval | Plan Summary |  |  |  |
| Apply | Approved Plan |  |  |  |

## Artifact 보호

- Plan 저장 위치:
- 암호화 방법:
- 읽기 권한:
- 보존 기간:
- 삭제 방법:

## 동시 실행

- State 식별자:
- CI Concurrency Key:
- State Lock:
- 오래된 실행 취소 기준:
