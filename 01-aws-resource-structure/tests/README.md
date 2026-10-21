# 검증 시나리오

## 정상 시나리오

- 각 서비스의 Scope가 공식 문서와 일치한다.
- Region 선택 기준이 워크로드 요구사항과 연결된다.

## 실패 시나리오

- Regional Resource를 Zonal로 잘못 분류한 항목을 찾아 수정한다.
- Multi AZ가 Region 장애까지 해결한다는 가정을 반례로 검증한다.

예상 결과, 실제 결과, 차이와 수정 내용을 `submission/result.md`에 기록한다.
