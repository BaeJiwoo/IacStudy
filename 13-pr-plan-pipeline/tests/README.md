# 검증 시나리오

## 정상 시나리오

- 신뢰하는 Branch의 Pull Request에서 검증과 Plan이 성공한다.
- 삭제와 교체 수가 Job Summary에서 명확히 보인다.

## 실패 시나리오

- Fork Pull Request가 AWS 쓰기 자격 증명을 얻지 못해야 한다.
- 동일 State의 중복 Workflow가 동시에 Apply 가능한 상태가 되지 않아야 한다.

실패가 예상한 단계에서 발생했는지 확인하고 우회가 가능한지도 점검한다.
