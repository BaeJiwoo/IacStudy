# 조사 자료와 질문

## 공식 자료

- [CloudFormation 작동 방식](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-overview.html)
- [Template 구조](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
- [Parameters](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/parameters-section-structure.html)
- [Intrinsic Functions](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/intrinsic-function-reference.html)
- [Stack 생성](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-cli-creating-stack.html)

## 조사 질문

1. Template, Stack과 Stack Resource는 각각 어떤 객체인가.
2. Logical ID를 바꾸면 기존 리소스의 변경 계획에 어떤 영향이 생기는가.
3. `Ref`가 Parameter와 Resource에 대해 반환하는 값은 어떻게 다른가.
4. CloudFormation이 리소스 생성 순서를 추론하는 기준은 무엇인가.
5. Stack 작업 실패 시 Event를 어떤 순서로 조사해야 하는가.
6. `DeletionPolicy: Retain`과 Stack 삭제 실패는 어떻게 다른가.
