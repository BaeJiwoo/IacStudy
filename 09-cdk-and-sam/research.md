# 조사 자료와 질문

## 공식 자료

- [AWS CDK 핵심 개념](https://docs.aws.amazon.com/cdk/v2/guide/core-concepts.html)
- [CDK 앱](https://docs.aws.amazon.com/cdk/v2/guide/apps.html)
- [CDK 합성 구성](https://docs.aws.amazon.com/cdk/v2/guide/configure-synth.html)
- [CDK 권장사항](https://docs.aws.amazon.com/cdk/v2/guide/best-practices.html)
- [AWS SAM 사용](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/chapter-using-sam.html)
- [SAM CLI 명령](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/serverless-sam-cli-command-reference.html)

## 조사 질문

1. L1, L2와 L3 Construct의 추상화 수준과 Escape Hatch가 필요한 경우는 무엇인가.
2. CDK Token이 Synth 시점과 Deploy 시점 값에 어떤 영향을 주는가.
3. CDK Bootstrap Stack은 어떤 Resource와 신뢰 관계를 만드는가.
4. `cdk diff`와 CloudFormation Change Set의 검토 시점은 어떻게 다른가.
5. SAM Transform이 일반 CloudFormation Resource로 확장되는 과정은 무엇인가.
6. `sam local`이 실제 AWS 권한, 네트워크와 관리형 서비스 동작을 완전히 재현하지 못하는 이유는 무엇인가.
