# 과제 13 Pull Request Plan Pipeline

코드 변경을 AWS에 적용하기 전에 자동 검증과 Terraform Plan을 실행하고, 검토자가 위험을 판단할 수 있는 결과를 제공한다.

## 선행 과제

- `12-modules-remote-state`

## 시작 파일

- [starter/plan.yml](./starter/plan.yml): GitHub Actions Workflow 시작점
- [starter/plan-summary.sh](./starter/plan-summary.sh): Plan JSON 요약 Script
- [pipeline-design.md](./pipeline-design.md): 단계와 실패 처리 설계

Workflow를 실행하려면 `starter/plan.yml`을 저장소의 `.github/workflows/plan.yml`로 복사하고 실제 Terraform 작업 경로를 수정한다.

## 과제

1. [research.md](./research.md)의 CI와 Plan 보안 항목을 조사한다.
2. Pull Request에서 `fmt`, `validate`, `test`, TFLint와 Plan을 실행한다.
3. 생성, 변경, 교체와 삭제 수를 Job Summary 또는 Pull Request에 표시한다.
4. 변경된 환경만 실행하고 같은 State의 동시 실행을 막는다.
5. Plan 파일의 암호화, 접근 권한과 보존 기간을 정한다.
6. 실패 메시지가 실행 단계와 수정 방법을 알려주게 한다.

과제별 용어, 제출 형식과 검증 항목은 [keywords.md](./keywords.md), [assignment.md](./assignment.md), [tests/README.md](./tests/README.md)와 [checklist.md](./checklist.md)를 함께 사용한다.

## 완료 기준

- [ ] 신뢰하지 않는 Pull Request에 AWS 쓰기 권한을 부여하지 않는다.
- [ ] Plan과 Apply에 사용할 Commit SHA를 기록한다.
- [ ] Plan 아티팩트를 Secret과 같은 수준으로 보호한다.
- [ ] 동일 State에 대한 Pipeline 실행이 직렬화된다.
- [ ] 삭제 및 교체가 검토 화면에서 명확하게 보인다.
