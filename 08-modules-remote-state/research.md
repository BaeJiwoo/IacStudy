# 과제 08 조사 자료

## 공식 자료

- [Terraform Module](https://developer.hashicorp.com/terraform/language/modules)
- [Terraform S3 Backend](https://developer.hashicorp.com/terraform/language/backend/s3)
- [Terraform State Locking](https://developer.hashicorp.com/terraform/language/state/locking)
- [AWS Terraform Backend 권장사항](https://docs.aws.amazon.com/prescriptive-guidance/latest/terraform-aws-provider-best-practices/backends.html)

## 조사 질문

1. Module과 Root Module은 각각 어떤 결정을 책임져야 하는가
2. State를 너무 크게 또는 너무 작게 나눌 때 어떤 문제가 생기는가
3. Terraform State 읽기 권한도 제한해야 하는 이유는 무엇인가
4. S3 Versioning이 State 손상과 실수에 어떻게 도움을 주는가
5. S3 Lockfile과 과거 DynamoDB 잠금 방식의 차이는 무엇인가
6. Workspace가 AWS Account 수준의 보안 경계를 대신할 수 없는 이유는 무엇인가
