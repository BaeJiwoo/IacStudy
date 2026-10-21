# 과제 15 조사 자료

## 검토할 기존 자료

- [최종 프로젝트 명세](../02-capstone-project.md)
- [운영 준비 체크리스트](../checklists/production-readiness.md)
- [AWS Well Architected Framework](https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html)
- [AWS Terraform Provider 권장사항](https://docs.aws.amazon.com/prescriptive-guidance/latest/terraform-aws-provider-best-practices/introduction.html)

## 최종 검토 질문

1. 이 서비스가 해결하는 사용자 문제는 무엇인가
2. Git, 요청 데이터베이스와 Terraform State의 책임은 어떻게 다른가
3. 가장 큰 보안 위험과 이를 줄이는 통제는 무엇인가
4. Worker 또는 CI가 침해됐을 때 영향 범위는 어디까지인가
5. State가 손상됐을 때 복구 가능한가
6. Production 삭제가 어떤 단계에서 누구에게 보이는가
7. 서비스 규모가 10배가 되면 먼저 변경해야 하는 구성은 무엇인가
8. 직접 구현하지 않고 HCP Terraform, Control Tower 또는 Service Catalog를 선택할 조건은 무엇인가
