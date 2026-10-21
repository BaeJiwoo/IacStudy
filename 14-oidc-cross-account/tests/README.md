# 검증 시나리오

## 정상 시나리오

- 허용 Repository와 Branch가 임시 자격 증명을 받고 Development Role을 인수한다.
- CloudTrail에서 Run ID 또는 Commit SHA를 포함한 Session을 찾는다.

## 실패 시나리오

- 다른 Repository 또는 Branch의 Subject는 Role 인수가 거부돼야 한다.
- 잘못된 Audience Token은 OIDC Trust 조건에서 거부돼야 한다.

실패가 예상한 단계에서 발생했는지 확인하고 우회가 가능한지도 점검한다.
