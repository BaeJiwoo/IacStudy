# 검증 시나리오

## 정상 시나리오

- 안전한 CloudFormation Template과 Terraform Plan이 모든 정책을 통과한다.
- 각 정책에 최소 하나의 통과 Fixture가 있다.

## 실패 시나리오

- `negative-input.json`이 OPA 정책에서 차단돼야 한다.
- 암호화나 공개 차단 설정이 빠진 Template이 Guard 또는 Checkov에서 실패해야 한다.

실패가 예상한 단계에서 발생했는지 확인하고 우회가 가능한지도 점검한다.
