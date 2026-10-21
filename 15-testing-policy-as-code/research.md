# 과제 15 조사 자료

## 공식 자료

- [Terraform Test](https://developer.hashicorp.com/terraform/cli/commands/test)
- [Terraform Custom Conditions](https://developer.hashicorp.com/terraform/language/expressions/custom-conditions)
- [Checkov](https://www.checkov.io/1.Welcome/What%20is%20Checkov.html)
- [Open Policy Agent Terraform](https://www.openpolicyagent.org/docs/terraform)
- [AWS 중앙 Checkov 정책 검사 패턴](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/centralized-custom-checkov-scanning.html)
- [CloudFormation Guard](https://docs.aws.amazon.com/cfn-guard/latest/ug/what-is-guard.html)

## 조사 질문

1. Variable Validation, Precondition, Postcondition과 Test Assertion은 각각 언제 사용하는가
2. HCL 정적 검사와 Plan JSON 검사가 발견할 수 있는 문제는 어떻게 다른가
3. Mock Provider 테스트와 실제 Apply 테스트의 Trade Off는 무엇인가
4. 정책을 Warning과 Mandatory로 구분하는 기준은 무엇인가
5. 정책 예외가 영구적인 우회 경로가 되지 않게 하려면 무엇을 기록해야 하는가
6. 조직 공통 정책 변경 자체를 어떻게 테스트하고 배포할 것인가
