# 검증 시나리오

## 정상 시나리오

- Development와 Production의 승인 차이가 적용되고 OIDC로 배포된다.
- 승인된 CloudFormation Product 또는 Terraform Module이 배포 후 검증까지 완료된다.

## 실패 시나리오

- 정책 위반과 변경된 Plan Artifact가 Apply 전에 차단된다.
- 부분 실패와 Drift를 Runbook으로 진단하고 안전한 상태로 복구한다.

각 시나리오는 입력, 기대 상태 전이, 실제 결과, 감사 Event와 복구 결과를 포함한다.
