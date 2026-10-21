# 실습 과제

## 1 Change Set 검토

07 과제의 Stack을 다시 생성하고 Template의 Subnet 태그와 CIDR을 변경한다. [create-change-set.sh](./starter/create-change-set.sh)로 Change Set을 만든 뒤 다음을 기록한다.

- 생성, 수정, 삭제되는 Resource
- Replacement 여부와 Scope
- 예상 중단과 데이터 손실 가능성
- 실행 또는 거부 결정과 근거

## 2 보호 정책과 정책 검사

1. [stack-policy.json](./starter/stack-policy.json)을 수정해 보호할 Logical ID를 선택한다.
2. 정책으로 차단되는 변경을 시도하고 CloudFormation Event를 확인한다.
3. Guard로 [baseline-stackset.yaml](./starter/baseline-stackset.yaml)을 검사한다.

```bash
cfn-guard validate \
  --rules starter/s3-security.guard \
  --data starter/baseline-stackset.yaml
```

## 3 StackSets 설계

실제 Organizations Sandbox가 없다면 실행 대신 설계와 CLI Dry Run 수준으로 수행한다.

1. Log Archive 목적의 S3 기본 구성을 두 Account와 두 Region에 배포하는 계획을 작성한다.
2. OU Target, Region 순서, Max Concurrent와 Failure Tolerance를 정한다.
3. 한 Region 실패 시 Operation을 중지할지 계속할지 결정한다.

## 4 Drift와 복구

1. Sandbox 리소스의 태그를 Console 또는 CLI에서 직접 변경한다.
2. Drift Detection을 실행하고 차이를 기록한다.
3. 코드에 반영할지 실제 리소스를 원복할지 결정한다.
4. `UPDATE_ROLLBACK_FAILED` 대응 Runbook을 `submission/decisions.md`에 작성한다.

모든 실습 후 Stack과 StackSet Instance를 먼저 제거하고 관리 StackSet을 삭제한다.
