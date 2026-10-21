# 과제 09 AWS CDK와 SAM

## 목표

AWS CDK 코드를 CloudFormation Template으로 합성하고, AWS SAM으로 서버리스 애플리케이션을 빌드하고 로컬 검증한다. 추상화가 편의성을 높이는 대신 생성되는 리소스와 권한을 반드시 검토해야 하는 이유를 확인한다.

## 선행 과제

- `07-cloudformation-basics`
- `08-cloudformation-operations` 권장

## 준비된 파일

- [keywords.md](./keywords.md): CDK와 SAM 핵심 용어
- [research.md](./research.md): 공식 자료와 조사 질문
- [assignment.md](./assignment.md): Synth, Diff와 SAM 실습
- `cdk-app/`: TypeScript CDK VPC 시작 애플리케이션
- `sam-app/`: Python Lambda와 API 시작 애플리케이션
- [tests/README.md](./tests/README.md): 검증 및 실패 시나리오
- [checklist.md](./checklist.md): 완료 기준

## 핵심 결과물

1. CDK Construct Tree와 합성된 CloudFormation Template 비교
2. `cdk diff`의 IAM 및 리소스 변경 검토 기록
3. SAM 로컬 호출과 배포 결과
4. CloudFormation, CDK와 SAM 선택 기준
