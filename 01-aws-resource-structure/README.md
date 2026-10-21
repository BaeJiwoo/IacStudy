# 과제 01 AWS 리소스 구조와 장애 경계

AWS 인프라를 코드로 만들기 전에 Organization, Account, Region, Availability Zone과 개별 리소스의 범위를 구분한다. 이 과제의 결과는 이후 모든 아키텍처와 Terraform State 분리의 기준이 된다.

## 진행 순서

1. [research.md](./research.md)의 공식 자료를 읽고 조사 질문에 답한다.
2. [resource-scope.md](./resource-scope.md)에 주요 서비스의 범위와 장애 영향을 정리한다.
3. [region-decision.md](./region-decision.md)에 서비스용 Region 선택 근거를 작성한다.
4. [architecture.mmd](./architecture.mmd)를 완성해 AWS 리소스 계층을 표현한다.

## 과제

서울 사용자를 대상으로 하는 결제 API를 가정한다. Production과 Development 환경을 분리하고, 단일 Availability Zone 장애 시 서비스를 유지해야 한다. 데이터는 대한민국 Region에 저장해야 한다.

다음을 설계한다.

- Organization, OU와 AWS Account 구조
- 사용할 Region과 Availability Zone 수
- Global, Regional, Zonal 리소스 분류
- 단일 AZ 및 Region 장애의 영향
- 계정, Region과 리소스에 적용할 기본 태그

## 제출물

- 완성된 리소스 범위 표
- Region 선택 결정 기록
- 리소스 계층 다이어그램
- 조사 질문 답변

## 완료 기준

- [ ] Account, Region, Availability Zone과 VPC의 격리 목적을 각각 설명할 수 있다.
- [ ] IAM, Route 53, VPC, S3, EC2, EBS와 RDS의 리소스 범위를 구분했다.
- [ ] Multi AZ와 Multi Region의 목적 및 비용 차이를 설명했다.
- [ ] Region 선택에 데이터 주권, 지연 시간, 서비스 가용성과 비용을 반영했다.

완료하면 `02-vpc-networking`으로 이동한다.
