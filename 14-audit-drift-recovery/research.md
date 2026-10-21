# 과제 14 조사 자료

## 공식 자료

- [AWS CloudTrail](https://docs.aws.amazon.com/awscloudtrail/latest/userguide/cloudtrail-user-guide.html)
- [AWS Config](https://docs.aws.amazon.com/config/latest/developerguide/WhatIsConfig.html)
- [CloudFormation Drift Detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html)
- [Terraform State 복구](https://developer.hashicorp.com/terraform/language/state)
- [AWS Cost Anomaly Detection](https://docs.aws.amazon.com/cost-management/latest/userguide/manage-ad.html)

## 조사 질문

1. CloudTrail Event와 Terraform 실행을 어떤 식별자로 연결할 것인가
2. Drift와 승인된 긴급 변경을 어떻게 구분할 것인가
3. Apply 중 Worker가 종료되면 어떤 순서로 상태를 확인해야 하는가
4. Force Unlock이 위험한 이유와 실행 전 확인 사항은 무엇인가
5. 인프라에서 자동 Rollback보다 Forward Fix가 적합한 경우는 언제인가
6. Plan만으로 정확한 비용을 알기 어려운 이유는 무엇인가
