# 과제 13 조사 자료

## 공식 자료

- [GitHub Environment](https://docs.github.com/actions/deployment/targeting-different-environments/managing-environments-for-deployment)
- [GitHub Branch 보호 규칙](https://docs.github.com/repositories/configuring-branches-and-merges-in-your-repository/managing-protected-branches)
- [Terraform Apply](https://developer.hashicorp.com/terraform/cli/commands/apply)
- [GitHub Actions Artifact](https://docs.github.com/actions/using-workflows/storing-workflow-data-as-artifacts)

## 조사 질문

1. GitOps에서 Git과 실제 AWS 리소스가 달라질 수 있는 원인은 무엇인가
2. 요청자가 자신의 Production 배포를 승인하면 안 되는 이유는 무엇인가
3. 승인 후 Commit이 변경됐을 때 이전 승인을 무효화하려면 어떻게 해야 하는가
4. Saved Plan Apply와 Apply 시점의 새 Plan은 안전성 측면에서 어떻게 다른가
5. Plan Artifact가 변조되지 않았음을 어떻게 확인할 것인가
6. Apply 성공 뒤 어떤 리소스 상태를 검증해야 하는가
