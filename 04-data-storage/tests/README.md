# 검증 시나리오

## 정상 시나리오

- Backup에서 격리된 환경으로 Restore하고 데이터 무결성을 확인한다.
- KMS Key와 Resource 접근 주체가 최소 권한으로 연결된다.

## 실패 시나리오

- Backup은 있지만 복원 권한 또는 Key가 없는 상황을 분석한다.
- Region 장애가 Multi AZ 구성에 미치는 영향을 검증한다.

예상 결과, 실제 결과, 차이와 수정 내용을 `submission/result.md`에 기록한다.
