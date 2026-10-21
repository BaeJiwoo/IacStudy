# 과제 11 Terraform 자원 수명 주기와 기존 자원 편입

## 목표

이미 존재하는 AWS Resource를 Terraform State에 안전하게 편입하고, Resource Address와 Module 구조를 변경할 때 불필요한 삭제 및 재생성을 방지한다. Import가 코드를 자동 완성하거나 운영 책임을 대신하지 않는다는 점을 확인한다.

## 선행 과제

- `10-terraform-basics`

## 준비된 파일

- [keywords.md](./keywords.md): Import와 Refactoring 핵심 용어
- [research.md](./research.md): 공식 자료와 조사 질문
- [assignment.md](./assignment.md): 기존 S3 Bucket 편입과 Refactoring 실습
- `starter/`: Import Block이 포함된 Terraform 시작 코드
- `examples/`: `moved`, `removed`와 Provider Alias 예제
- [tests/README.md](./tests/README.md): 검증 및 실패 시나리오
- [checklist.md](./checklist.md): 완료 기준

## 핵심 결과물

1. 기존 Resource 조사표와 소유권 결정
2. Import 전후 Plan 비교
3. `moved` Block을 이용한 무변경 Refactoring
4. `prevent_destroy` 예외와 State 복구 절차
