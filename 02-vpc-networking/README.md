# 과제 02 VPC 네트워크와 패킷 경로

두 개 이상의 Availability Zone을 사용하는 VPC를 설계하고, 사용자 요청과 워크로드의 외부 통신이 어떤 경로로 이동하는지 설명한다.

## 선행 과제

- `01-aws-resource-structure`

## 진행 순서

1. [research.md](./research.md)의 네트워크 구성요소를 조사한다.
2. [network-plan.md](./network-plan.md)에 CIDR과 Subnet을 할당한다.
3. [packet-path.md](./packet-path.md)에 Ingress와 Egress 경로를 작성한다.
4. [architecture.mmd](./architecture.mmd)에 Route Table과 보안 경계를 추가한다.

## 과제

결제 API를 위한 VPC를 설계한다. 두 개의 Availability Zone에 Public, Private App, Private Data Subnet을 각각 배치한다. 애플리케이션은 인터넷에서 직접 접근할 수 없고, S3와 Secrets Manager에 접근해야 한다.

다음을 결정한다.

- VPC와 Subnet CIDR
- Internet Gateway와 NAT Gateway 배치
- VPC Endpoint 적용 대상
- Route Table 연결
- Security Group과 Network ACL 규칙
- 향후 다른 VPC 또는 온프레미스 연결 방식

## 완료 기준

- [ ] Public Subnet과 Private Subnet을 Route 기준으로 설명할 수 있다.
- [ ] 사용자부터 Application까지 Ingress 경로를 설명했다.
- [ ] Application부터 인터넷 및 AWS 서비스까지 Egress 경로를 구분했다.
- [ ] DNS, Route, Security Group과 Network ACL 순서로 연결 문제를 점검할 수 있다.
- [ ] CIDR에 향후 확장 공간이 있다.
