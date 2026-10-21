# 최종 프로젝트 인수 체크리스트

## 기능

- [ ] 사용자 요청이 검증되고 Git 변경으로 기록된다.
- [ ] Pull Request에서 Change Set 또는 Plan과 정책 결과를 확인할 수 있다.
- [ ] Development와 Production에 다른 승인 규칙이 적용된다.
- [ ] 승인된 Commit과 Change Preview만 실행된다.
- [ ] 실행 후 실제 리소스 상태를 검증한다.
- [ ] 승인된 CloudFormation Product 또는 Terraform Module만 선택할 수 있다.

## 보안

- [ ] 정적 AWS Access Key가 없다.
- [ ] OIDC Trust가 Repository와 Branch 또는 Environment로 제한된다.
- [ ] Stack 정보, State, Change Preview와 로그의 읽기 권한이 제한된다.
- [ ] Production 삭제와 데이터 교체에 추가 승인이 있다.
- [ ] 사용자 입력이 실행 명령으로 직접 연결되지 않는다.

## 신뢰성과 운영

- [ ] 중복 요청과 동일 Stack 또는 State의 동시 실행이 차단된다.
- [ ] Request ID로 API부터 CloudTrail까지 추적할 수 있다.
- [ ] Drift가 탐지되고 담당자에게 전달된다.
- [ ] Stack 및 Terraform 실행 실패와 상태 복구 Runbook이 검증됐다.
- [ ] 서비스 지표와 사용자 영향 경보가 있다.
- [ ] 비용과 잔여 리소스를 확인하는 절차가 있다.

## 문서와 시연

- [ ] 신규 사용자가 README만으로 Development 배포를 재현할 수 있다.
- [ ] 설계 선택의 대안과 Trade Off가 기록돼 있다.
- [ ] 정상 배포와 최소 3개의 실패 시나리오를 시연할 수 있다.
- [ ] CloudFormation과 Terraform 실행기 선택 기준이 기록돼 있다.
- [ ] 알려진 제한과 향후 개선 목록이 있다.
