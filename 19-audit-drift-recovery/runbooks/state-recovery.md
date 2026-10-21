# Terraform State 복구 Runbook

## 복구 전 확인

- [ ] 모든 Terraform 실행을 중지했다.
- [ ] 대상 Account, Region, Backend와 State Key를 확인했다.
- [ ] 현재 State를 별도 위치에 백업했다.
- [ ] 실제 AWS 리소스 목록을 확보했다.
- [ ] 복구할 S3 Object Version과 생성 시점을 확인했다.
- [ ] 복구 작업 승인을 받았다.

## 복구 절차

1. 현재 State와 복구 후보 State의 차이를 비교한다.
2. 복구 후보를 격리된 위치에 내려받는다.
3. State Lineage와 Serial을 확인한다.
4. 승인된 방식으로 State를 복원한다.
5. Refresh Only Plan을 확인한다.
6. 일반 Plan에서 예상하지 못한 생성 또는 삭제가 없는지 확인한다.
7. 잠금과 Pipeline을 다시 활성화한다.

## Force Unlock 조건

- 기존 실행이 완전히 종료됐음을 확인하는 방법:
- Lock ID 확인 방법:
- 승인자:
- 실행 결과:
