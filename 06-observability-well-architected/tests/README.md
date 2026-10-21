# 검증 시나리오

## 정상 시나리오

- 서비스 오류가 SLI와 Alarm에 반영되고 관련 Log와 Trace를 찾을 수 있다.
- CloudTrail과 Config에서 변경 주체와 전후 구성을 확인할 수 있다.

## 실패 시나리오

- Alarm은 울리지만 조치 방법이 없는 항목을 제거하거나 Runbook과 연결한다.
- Log 수집 계층 자체 장애 시 탐지 공백을 분석한다.

예상 결과, 실제 결과, 차이와 수정 내용을 `submission/result.md`에 기록한다.
