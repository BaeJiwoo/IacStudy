# 과제 09 조사 자료

## 공식 자료

- [GitHub Actions Workflow 문법](https://docs.github.com/actions/writing-workflows/workflow-syntax-for-github-actions)
- [GitHub Actions 보안 강화](https://docs.github.com/actions/security-for-github-actions/security-guides/security-hardening-for-github-actions)
- [Terraform Plan](https://developer.hashicorp.com/terraform/cli/commands/plan)
- [Terraform JSON 출력 형식](https://developer.hashicorp.com/terraform/internals/json-format)

## 조사 질문

1. Fork Pull Request에 Secret 또는 AWS 권한을 주면 어떤 공격이 가능한가
2. Plan 파일에 민감 정보가 포함될 수 있는 이유는 무엇인가
3. 검토한 Plan과 Apply한 변경이 달라지는 TOCTOU 문제는 어떻게 막는가
4. GitHub Actions의 `concurrency`는 Terraform State Lock과 어떤 점이 다른가
5. CI Log와 Artifact의 접근 및 보존 기간은 어떻게 정할 것인가
6. 변경 경로에 따라 필요한 Terraform Root Module만 실행하려면 어떻게 해야 하는가
