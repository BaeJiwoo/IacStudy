# 검증 시나리오

## 정상 시나리오

- 정상 요청이 모든 계층의 Health Check를 통과한다.
- 한 AZ가 중단돼도 목표 Capacity와 오류율을 유지한다.

## 실패 시나리오

- 잘못된 Health Check로 정상 Target이 제거되는 상황을 분석한다.
- 배포 중 새 Version 오류가 발생할 때 Traffic 복구 절차를 검증한다.

예상 결과, 실제 결과, 차이와 수정 내용을 `submission/result.md`에 기록한다.
