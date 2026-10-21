# 검증 시나리오

## CDK

- TypeScript Compile과 `cdk synth`가 성공한다.
- 합성된 Template에 NAT Gateway가 없어야 한다.
- 두 개 AZ에 Public 및 Isolated Subnet이 생성되는지 Template에서 확인한다.
- `natGateways: 1` 변경 시 `cdk diff`에 비용 발생 Resource가 나타나야 한다.

## SAM

- `sam validate --lint`와 `sam build`가 성공한다.
- 기본 Event 호출이 200 응답과 기본 이름을 반환한다.
- Query String의 이름이 응답에 반영된다.
- `queryStringParameters`가 `null`이어도 함수가 실패하지 않아야 한다.

실제 배포 시 CloudFormation Change Set과 생성된 IAM Role의 권한을 별도로 검토한다.
