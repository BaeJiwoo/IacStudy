# 검증 시나리오

## 정상 시나리오

- 기본 Parameter로 Template 정적 검증이 성공한다.
- Stack 생성 후 VPC와 두 Subnet의 CIDR이 입력값과 같다.
- Public Route Table에 Internet Gateway 기본 경로가 있다.
- Private Subnet에는 인터넷 기본 경로가 없다.

## 실패 시나리오

- `Environment=production`을 전달하면 Allowed Values 검증에 실패해야 한다.
- 두 Subnet에 같은 CIDR을 전달하면 리소스 생성이 실패하고 Stack Event에 원인이 남아야 한다.
- 존재하지 않는 Resource를 `Ref`하면 `cfn-lint` 또는 Template 검증 단계에서 실패해야 한다.

실패는 실제 운영 Stack이 아닌 Sandbox의 별도 Stack 이름으로 실행한다. 예상한 단계에서 차단됐는지와 Rollback 결과를 `submission/result.md`에 기록한다.
