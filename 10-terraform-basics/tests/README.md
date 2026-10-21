# 검증 시나리오

## 정상 시나리오

- Format, Validate와 Test를 통과하고 예상 Resource 수가 Plan에 표시된다.
- Apply 후 Output과 실제 VPC Resource가 일치한다.

## 실패 시나리오

- 잘못된 CIDR이 Validation 또는 Test에서 차단돼야 한다.
- 교체를 유발하는 변경을 Apply 전에 Plan에서 식별해야 한다.

실패가 예상한 단계에서 발생했는지 확인하고 우회가 가능한지도 점검한다.
