# 과제 10 조사 자료

## 공식 자료

- [Terraform 언어](https://developer.hashicorp.com/terraform/language)
- [Terraform CLI](https://developer.hashicorp.com/terraform/cli/commands)
- [Terraform State](https://developer.hashicorp.com/terraform/language/state)
- [Terraform Provider 요구사항](https://developer.hashicorp.com/terraform/language/providers/requirements)
- [Terraform Test](https://developer.hashicorp.com/terraform/cli/commands/test)

## 조사 질문

1. Terraform은 코드, State와 실제 인프라를 어떻게 비교하는가
2. `init`, `validate`, `plan`과 `apply`는 각각 무엇을 검증하는가
3. Provider 버전 제약과 Lock File은 어떤 문제를 해결하는가
4. `sensitive = true`가 State의 값을 암호화하거나 제거하지 않는 이유는 무엇인가
5. `for_each`와 `count`를 변경할 때 리소스 주소가 어떻게 달라지는가
6. `terraform test`가 실제 리소스를 생성할 수 있는 조건은 무엇인가
