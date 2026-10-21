# 조사 자료와 질문

## 공식 자료

- [Change Set으로 Stack 갱신](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-changesets.html)
- [Stack Policy](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/protect-stack-resources.html)
- [Drift 탐지](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html)
- [StackSets 개념](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-concepts.html)
- [StackSets 권한 모델](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-prereqs.html)
- [Update Rollback 계속](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-continueupdaterollback.html)
- [CloudFormation Guard](https://docs.aws.amazon.com/cfn-guard/latest/ug/what-is-guard.html)
- [CloudFormation Hooks](https://docs.aws.amazon.com/cloudformation-cli/latest/hooks-userguide/what-is-cloudformation-hooks.html)

## 조사 질문

1. Change Set의 `Modify`와 `Replace`를 검토할 때 어떤 속성을 확인해야 하는가.
2. Stack Policy와 IAM Policy는 각각 어떤 행위를 제한하는가.
3. CloudFormation이 Drift를 탐지하지 못하는 속성이나 리소스는 어떻게 보완하는가.
4. StackSets의 Service Managed와 Self Managed 권한 모델은 어떻게 다른가.
5. Failure Tolerance와 Max Concurrent 설정이 배포 속도와 Blast Radius에 미치는 영향은 무엇인가.
6. `UPDATE_ROLLBACK_FAILED`에서 리소스 건너뛰기가 위험한 이유는 무엇인가.
7. Guard와 Hook은 Pipeline 검사와 CloudFormation 실행 중 어느 시점에 동작하는가.
