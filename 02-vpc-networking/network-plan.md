# VPC 주소 계획

## 기본 정보

- VPC 이름:
- VPC CIDR:
- 예상 워크로드 수:
- 확장 계획:

## Subnet 계획

| 이름 | Availability Zone | 유형 | CIDR | Route Table | 예상 리소스 |
| --- | --- | --- | --- | --- | --- |
| public-a | AZ A | Public |  |  | ALB, NAT Gateway |
| public-b | AZ B | Public |  |  | ALB, NAT Gateway |
| app-a | AZ A | Private App |  |  | ECS 또는 EC2 |
| app-b | AZ B | Private App |  |  | ECS 또는 EC2 |
| data-a | AZ A | Private Data |  |  | RDS |
| data-b | AZ B | Private Data |  |  | RDS |

## 비용과 가용성 결정

- NAT Gateway 수:
- NAT Gateway 배치 근거:
- 사용할 VPC Endpoint:
- Cross AZ 트래픽 최소화 방법:
