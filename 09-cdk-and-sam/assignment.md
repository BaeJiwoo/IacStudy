# 실습 과제

## 1 CDK 합성

```bash
cd cdk-app
npm install
npm run build
npx cdk synth
```

합성된 Template에서 다음을 찾는다.

- 직접 작성하지 않았지만 생성된 Resource
- VPC, Subnet과 Route Table의 Logical ID
- CDK Metadata와 Bootstrap Asset 의존성
- 태그와 삭제 정책

`maxAzs`와 `natGateways`를 바꾸고 `cdk diff`의 변화 및 비용 영향을 기록한다. 실제 배포 시에는 Sandbox 환경과 명시적 Account 및 Region을 사용한다.

## 2 SAM 로컬 검증

```bash
cd sam-app
sam validate --lint
sam build
sam local invoke HelloFunction --event events/hello.json
```

응답 Status Code와 Body를 확인하고 잘못된 Event에 대한 실패 처리를 추가한다. Sandbox에 배포한다면 `sam deploy --guided`의 생성된 설정과 Change Set을 검토한다.

## 3 도구 선택 기록

다음 요구사항에 CloudFormation, CDK, SAM 또는 Terraform 중 하나를 선택하고 근거를 남긴다.

1. 조직 전체에 동일한 Config Recorder 배포
2. 여러 팀이 공유하는 복잡한 Application Pattern
3. Lambda와 API Gateway 중심의 소규모 서비스
4. AWS 외부 Provider를 포함한 멀티 플랫폼 구성

추상화 수준, 팀 언어, 테스트, State 소유권, 배포 권한과 운영 도구를 판단 기준에 포함한다.
