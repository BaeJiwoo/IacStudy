# 과제 17 조사 자료

## 공식 자료

- [Amazon API Gateway](https://docs.aws.amazon.com/apigateway/latest/developerguide/welcome.html)
- [Amazon SQS](https://docs.aws.amazon.com/AWSSimpleQueueService/latest/SQSDeveloperGuide/welcome.html)
- [AWS Step Functions](https://docs.aws.amazon.com/step-functions/latest/dg/welcome.html)
- [AWS CodeBuild](https://docs.aws.amazon.com/codebuild/latest/userguide/welcome.html)
- [DynamoDB 조건부 쓰기](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Expressions.ConditionExpressions.html)

## 조사 질문

1. 오래 실행되는 Terraform Apply를 동기 API 요청에서 처리하면 어떤 문제가 생기는가
2. At Least Once 전달에서 중복 Apply를 어떻게 막을 것인가
3. Terraform State Lock과 서비스 실행 잠금이 둘 다 필요한 이유는 무엇인가
4. Retry 가능한 오류와 사람의 확인이 필요한 오류를 어떻게 구분할 것인가
5. API 데이터베이스, Git과 Terraform State는 각각 어떤 정보의 원본인가
6. Worker를 요청별로 격리하고 실행 후 삭제해야 하는 이유는 무엇인가
