# 과제 17 자동 배포 서비스 모델

Terraform 실행 명령을 API 뒤에 감싸는 수준을 넘어 요청, Plan, 승인, Apply와 검증을 상태가 있는 비동기 서비스로 설계한다.

## 선행 과제

- `14-oidc-cross-account`
- `15-testing-policy-as-code`
- `16-service-catalog-control-tower`

## 시작 파일

- [starter/openapi.yaml](./starter/openapi.yaml): 배포 요청 API 계약
- [starter/deployment-request.json](./starter/deployment-request.json): 사용자 요청 예제
- [state-machine.mmd](./state-machine.mmd): 배포 상태 전이
- [data-model.md](./data-model.md): 요청과 실행 메타데이터

## 과제

1. [research.md](./research.md)에서 비동기 작업과 멱등성을 조사한다.
2. API 요청 스키마에 Account, Region, Module과 입력 제한을 추가한다.
3. 요청 상태 전이와 허용되지 않는 전이를 정의한다.
4. API와 Terraform Worker를 Queue로 분리한다.
5. Idempotency Key와 `account_id + region + state_key` 실행 잠금을 설계한다.
6. Worker가 중단된 뒤 상태를 복구하는 과정을 설계한다.

과제별 용어, 제출 형식과 검증 항목은 [keywords.md](./keywords.md), [assignment.md](./assignment.md), [tests/README.md](./tests/README.md)와 [checklist.md](./checklist.md)를 함께 사용한다.

## 완료 기준

- [ ] 동일 Idempotency Key가 두 번 Apply되지 않는다.
- [ ] 동일 State에 대한 Apply가 동시에 실행되지 않는다.
- [ ] 서비스 재시작 후 현재 실행 상태를 복원할 수 있다.
- [ ] API 입력이 Shell 명령이나 파일 경로로 직접 연결되지 않는다.
- [ ] 실패 기록을 새 실행의 성공 상태로 덮어쓰지 않는다.
