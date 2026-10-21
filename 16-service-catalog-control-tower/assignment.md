# 실습 과제

## 1 승인 제품 만들기

[product-template.yaml](./starter/product-template.yaml)을 검증하고 별도의 Artifact Bucket에 업로드한다. Template URL을 [portfolio.yaml](./starter/portfolio.yaml)에 전달해 Portfolio와 Product를 만든다.

실제 Service Catalog 배포 권한이 없다면 Template 검증, 제품 버전 전략, IAM 설계와 예상 API 흐름까지 문서화한다.

## 2 권한 경계 설계

다음 주체의 권한을 구분한다.

- Portfolio 및 Product 관리자
- 제품을 검색하고 Provision하는 사용자
- 실제 CloudFormation Stack을 실행하는 Launch Role
- 제품 Pipeline과 보안 검토자

사용자에게 S3 Bucket 생성 권한을 직접 주지 않고도 제품을 Provision할 수 있는 흐름을 그린다.

## 3 Control Tower와 AFT

1. Security, Log Archive, Shared Services와 Workload OU를 설계한다.
2. 각 OU에 Mandatory와 선택 Control을 배치한다.
3. [aft-account-request.tf.example](./starter/aft-account-request.tf.example)을 팀 Account 요청으로 수정한다.
4. Global, OU와 Account Customization의 실행 순서 및 실패 처리를 기록한다.

## 4 중복 통제 정리

[governance-map.md](./governance-map.md)에 요구사항별 통제 위치를 작성한다. 예방 통제로 모든 것을 막기보다 빠른 피드백, 조직 경계, 사후 탐지와 예외 승인 사이의 역할을 구분한다.
