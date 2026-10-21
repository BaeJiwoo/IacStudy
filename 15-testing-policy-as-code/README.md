# 과제 15 테스트와 Policy as Code

잘못된 인프라가 AWS에 생성되기 전에 Module 테스트, 정적 분석과 Plan 정책으로 차단한다.

## 선행 과제

- `08-cloudformation-operations`
- `12-modules-remote-state`
- `13-pr-plan-pipeline`

## 시작 파일

- [starter/policy.rego](./starter/policy.rego): Plan JSON 정책 시작점
- [starter/negative-input.json](./starter/negative-input.json): 차단돼야 하는 입력
- [starter/.checkov.yaml](./starter/.checkov.yaml): Checkov 설정 예제
- [test-matrix.md](./test-matrix.md): 정상 및 실패 테스트 설계

## 과제

1. [research.md](./research.md)에서 테스트 계층과 정책 도구를 조사한다.
2. Terraform Module에 입력 Validation, Precondition과 `terraform test`를 추가한다.
3. Checkov와 CloudFormation Guard로 공개 S3, 암호화 누락과 과도한 Security Group을 검사한다.
4. Terraform Plan JSON 정책으로 필수 태그, 허용 Region과 Production 삭제를 검사한다.
5. 각 정책에 정상 및 실패 입력을 만든다.
6. 예외에 담당자, 사유와 만료일을 요구하는 절차를 설계한다.

과제별 용어, 제출 형식과 검증 항목은 [keywords.md](./keywords.md), [assignment.md](./assignment.md), [tests/README.md](./tests/README.md)와 [checklist.md](./checklist.md)를 함께 사용한다.

## 완료 기준

- [ ] 구문 검사, 정적 분석, Module 테스트와 통합 테스트의 역할을 구분했다.
- [ ] 최소 3개의 정책과 각각의 실패 테스트가 있다.
- [ ] 정책 오류가 문제 리소스와 수정 방법을 알려준다.
- [ ] Production 삭제는 일반 변경보다 강한 승인을 요구한다.
- [ ] 실제 리소스를 만드는 테스트는 전용 계정에서 정리 여부를 확인한다.
