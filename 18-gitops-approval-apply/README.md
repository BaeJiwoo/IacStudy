# 과제 18 GitOps 승인과 Apply

사용자 요청을 Git 변경으로 만들고, 검토한 Commit과 Plan만 대상 AWS 계정에 적용한다.

## 선행 과제

- `17-deployment-service-model`

## 시작 파일

- [starter/request.yaml](./starter/request.yaml): Git에 저장할 인프라 요청
- [starter/apply.yml](./starter/apply.yml): 승인 후 Apply Workflow 시작점
- [approval-rules.md](./approval-rules.md): 환경별 승인 규칙

## 과제

1. [research.md](./research.md)에서 GitOps와 GitHub Environment 보호를 조사한다.
2. 요청 YAML을 검증하고 Terraform 입력으로 변환한다.
3. 요청으로 Pull Request를 만들고 Plan 결과를 연결한다.
4. Development와 Production에 서로 다른 승인 규칙을 적용한다.
5. Commit SHA와 Plan Digest가 승인 시점과 같은지 Apply 직전에 확인한다.
6. Apply 후 실제 리소스와 주요 상태를 검증한다.

과제별 용어, 제출 형식과 검증 항목은 [keywords.md](./keywords.md), [assignment.md](./assignment.md), [tests/README.md](./tests/README.md)와 [checklist.md](./checklist.md)를 함께 사용한다.

## 완료 기준

- [ ] Git이 원하는 인프라 상태의 원본이다.
- [ ] Production은 요청자와 다른 승인자가 필요하다.
- [ ] 승인 후 Commit 또는 Plan이 바뀌면 Apply가 거부된다.
- [ ] Apply는 OIDC로 대상 계정 역할을 인수한다.
- [ ] 실패 단계와 수정 가능한 오류가 요청 상태에 기록된다.
