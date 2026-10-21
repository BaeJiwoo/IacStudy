# 과제 20 최종 통합과 운영 검토

앞선 과제의 AWS 아키텍처, CloudFormation, Terraform, 조직 플랫폼, Pipeline과 운영 절차를 하나의 AWS IaC 자동 배포 서비스로 통합한다. 정상 배포뿐 아니라 거부, 실패, Drift와 복구를 시연해야 완료된다.

## 선행 과제

- `01-aws-resource-structure`부터 `19-audit-drift-recovery`까지 완료

## 시작 파일

- [project-plan.md](./project-plan.md): 구현 범위와 단계
- [repository-layout.md](./repository-layout.md): 최종 저장소 구조
- [acceptance-checklist.md](./acceptance-checklist.md): 인수 기준
- [demo-script.md](./demo-script.md): 시연 순서

## 필수 기능

- 승인된 Product 또는 Module을 사용하는 YAML 또는 API 요청
- Git Pull Request와 CloudFormation Change Set 또는 Terraform Plan
- Module 테스트, 보안 검사와 Policy as Code
- Development와 Production 승인 차이
- OIDC 기반 Cross Account Apply
- Commit SHA와 Plan Digest 검증
- 배포 후 리소스 검증
- 감사 로그와 실행 지표
- 정기 Drift 탐지
- 실패 및 State 복구 Runbook
- CloudFormation과 Terraform 실행기 선택 기준

## 최종 제출물

- 실행 가능한 저장소
- 설치 및 사용 README
- AWS 및 서비스 아키텍처 다이어그램
- 아키텍처 결정 기록
- 보안 및 State 운영 문서
- 정상 및 실패 시나리오의 실행 증거
- 운영 Runbook
- 비용과 리소스 정리 결과

## 완료 기준

[acceptance-checklist.md](./acceptance-checklist.md)의 필수 항목을 모두 충족하고, [demo-script.md](./demo-script.md)의 시나리오를 다른 사람이 재현할 수 있어야 한다.

과제별 용어, 제출 형식과 검증 항목은 [keywords.md](./keywords.md), [assignment.md](./assignment.md), [tests/README.md](./tests/README.md)와 [checklist.md](./checklist.md)를 함께 사용한다.
