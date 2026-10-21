# 과제 07 Terraform 기본 동작

이 과제부터 아키텍처를 실제 코드로 옮긴다. 시작 파일은 비용이 큰 NAT Gateway나 데이터베이스를 만들지 않으며, VPC와 Subnet을 중심으로 Terraform 실행 흐름을 학습한다.

## 선행 과제

- `06-observability-well-architected`

## 시작 파일

- [terraform.tf](./terraform.tf): Terraform 및 Provider 요구사항
- [variables.tf](./variables.tf): 입력값과 Validation
- [main.tf](./main.tf): VPC와 Subnet 시작 코드
- [outputs.tf](./outputs.tf): 주요 출력값
- [terraform.tfvars.example](./terraform.tfvars.example): 로컬 입력 예제
- [tests/basic.tftest.hcl](./tests/basic.tftest.hcl): 기본 Plan 테스트

## 진행 순서

1. [research.md](./research.md)의 개념과 명령을 조사한다.
2. `terraform.tfvars.example`을 `terraform.tfvars`로 복사하고 자신의 값으로 수정한다.
3. `terraform init`, `fmt`, `validate`, `test`, `plan`을 순서대로 실행한다.
4. `main.tf`의 TODO를 구현하고 Public 및 Private Route Table을 추가한다.
5. Plan에서 생성, 변경, 교체와 삭제를 각각 만들어 차이를 기록한다.
6. Sandbox 계정에서만 Apply하고 종료 후 Destroy 결과를 확인한다.

## 완료 기준

- [ ] Provider, Resource, Data Source, Variable, Local과 Output의 역할을 설명할 수 있다.
- [ ] `.terraform.lock.hcl`을 커밋해야 하는 이유를 설명했다.
- [ ] State와 Plan을 Git에 커밋하지 않았다.
- [ ] 변수 Validation과 테스트가 잘못된 입력을 차단한다.
- [ ] Plan에서 리소스 교체를 유발한 속성을 찾을 수 있다.
- [ ] 실습 리소스를 제거하고 AWS에서 잔여 리소스를 확인했다.
