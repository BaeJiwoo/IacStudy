# 검증 시나리오

## 정상 시나리오

- 사용자와 CI가 서로 다른 Role과 Session으로 대상 Account에 접근한다.
- 중앙 Log Account가 Workload 변경 주체를 추적할 수 있다.

## 실패 시나리오

- SCP가 허용 권한을 직접 부여한다고 가정한 정책을 수정한다.
- 잘못된 Trust Policy로 외부 Principal이 Role을 인수하는 위험을 분석한다.

예상 결과, 실제 결과, 차이와 수정 내용을 `submission/result.md`에 기록한다.
