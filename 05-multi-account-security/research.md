# 과제 05 조사 자료

## 공식 자료

- [AWS Organizations](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html)
- [AWS 멀티 계정 환경 구성](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/)
- [AWS Security Reference Architecture](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/introduction.html)
- [AWS Control Tower 멀티 계정 전략](https://docs.aws.amazon.com/controltower/latest/userguide/aws-multi-account-landing-zone.html)
- [IAM 권장사항](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)
- [Resource Control Policy](https://docs.aws.amazon.com/organizations/latest/userguide/orgs_manage_policies_rcps.html)
- [IAM Access Analyzer](https://docs.aws.amazon.com/IAM/latest/UserGuide/what-is-access-analyzer.html)

## 조사 질문

1. Account가 IAM, 비용, Quota와 장애 영향의 경계가 되는 방식은 무엇인가
2. OU를 조직도와 정확히 같게 만들 때 생길 수 있는 문제는 무엇인가
3. SCP가 허용한 작업이 IAM에서 자동으로 허용되지 않는 이유는 무엇인가
4. Security 계정과 Log Archive 계정을 분리하는 이유는 무엇인가
5. 사람의 역할과 배포 역할을 분리해야 하는 이유는 무엇인가
6. Break Glass 역할은 어떤 조건에서 어떻게 감사해야 하는가
7. SCP와 RCP가 각각 Identity 기반 요청과 Resource Policy의 최대 권한을 어떻게 제한하는가
8. Access Analyzer로 외부 접근과 미사용 권한을 어떻게 찾아낼 것인가
