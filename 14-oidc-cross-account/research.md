# 과제 14 조사 자료

## 공식 자료

- [AWS IAM OIDC 역할 생성](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-idp_oidc.html)
- [GitHub Actions와 AWS OIDC](https://docs.github.com/actions/security-for-github-actions/security-hardening-your-deployments/configuring-openid-connect-in-amazon-web-services)
- [AWS STS AssumeRole](https://docs.aws.amazon.com/STS/latest/APIReference/API_AssumeRole.html)
- [IAM Trust Policy](https://aws.amazon.com/blogs/security/how-to-use-trust-policies-with-iam-roles/)

## 조사 질문

1. OIDC가 장기 Access Key보다 안전한 이유는 무엇인가
2. Trust Policy와 Permission Policy는 각각 무엇을 제한하는가
3. GitHub OIDC Token의 `sub`와 `aud` Claim을 어떻게 제한해야 하는가
4. GitHub Environment 보호 규칙이 Production 역할과 어떻게 연결되는가
5. Role Session Name과 Session Tag를 감사에 어떻게 활용할 수 있는가
6. 대상 계정 역할이 Tooling 계정의 모든 역할을 신뢰하면 어떤 위험이 있는가
