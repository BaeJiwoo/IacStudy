# 실습 과제

## 1 Template 읽기와 검증

1. [starter/template.yaml](./starter/template.yaml)의 각 Section과 Resource 의존 관계를 표시한다.
2. `cfn-lint`와 AWS API 검증을 모두 실행한다.

```bash
cfn-lint starter/template.yaml
aws cloudformation validate-template --template-body file://starter/template.yaml
```

## 2 Stack 생성

Sandbox Profile을 사용해 Stack을 생성한다.

```bash
aws cloudformation deploy \
  --stack-name iac-study-cfn-basics \
  --template-file starter/template.yaml \
  --parameter-overrides file://starter/parameters.dev.json \
  --tags Project=iac-study ManagedBy=cloudformation
```

Stack Event, Resource와 Output을 조회하고 논리 ID와 물리 ID를 연결한다.

## 3 변경과 실패 관찰

1. Public Subnet CIDR 또는 태그를 변경하고 다시 배포한다.
2. 어떤 리소스가 수정 또는 교체됐는지 Event에서 확인한다.
3. [tests](./tests/)의 잘못된 Parameter로 실패를 발생시키고 Rollback 흐름을 기록한다.

## 4 정리

```bash
aws cloudformation delete-stack --stack-name iac-study-cfn-basics
aws cloudformation wait stack-delete-complete --stack-name iac-study-cfn-basics
```

VPC와 관련 리소스가 남지 않았는지 확인한 뒤 실행 증거를 `submission/result.md`에 기록한다.
