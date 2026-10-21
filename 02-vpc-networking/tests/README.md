# 검증 시나리오

## 정상 시나리오

- Public과 Private Subnet의 Route가 의도와 일치한다.
- 두 AZ의 주소 범위가 겹치지 않고 확장 여유가 있다.

## 실패 시나리오

- 기본 Route 또는 Return Path 누락으로 통신이 끊기는 지점을 찾는다.
- Security Group은 허용하지만 Network ACL이 차단하는 Case를 분석한다.

예상 결과, 실제 결과, 차이와 수정 내용을 `submission/result.md`에 기록한다.
