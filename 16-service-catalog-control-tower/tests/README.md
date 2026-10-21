# 검증 시나리오

## Service Catalog

- 두 CloudFormation Template이 정적 및 API 검증을 통과한다.
- 허용되지 않은 `DataClassification`은 Provision 전에 실패해야 한다.
- 제품 사용자는 직접 S3 생성 권한 없이 Launch Role을 통해 Provision해야 한다.
- 새 Artifact Version에서 기존 Provisioned Product의 Update 경로를 확인한다.
- Retain된 Bucket의 수명 주기와 제거 책임을 확인한다.

## Control Tower와 AFT

- 중복 Account Email 요청이 실패하는 지점을 설명한다.
- 필수 Account Tag가 없으면 Pipeline에서 차단되도록 설계한다.
- 허용되지 않은 OU 요청은 승인 또는 정책 단계에서 차단한다.
- Customization 실패가 계정 공급 상태와 재시도에 미치는 영향을 기록한다.

실제 조직 환경이 없다면 API 호출을 가장하지 말고 예상 입력, 권한, 상태 전이와 검증 방법을 제출한다.
