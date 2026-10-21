# 검증 시나리오

## Import

- 존재하지 않는 Bucket ID를 사용하면 Import가 실패해야 한다.
- 실제 속성을 코드에 모두 반영한 뒤 Plan에 변경이 없어야 한다.
- 같은 Bucket을 다른 Resource Address에 중복 Import하지 않는다.

## Refactoring

- Resource 이름만 바꾸고 `moved` Block을 빼면 Plan이 삭제와 생성을 제안하는지 확인한다.
- `moved` Block을 추가하면 원격 객체 ID가 유지되고 Plan에 변경이 없어야 한다.
- `prevent_destroy`가 있는 Resource의 Destroy가 실패해야 한다.

## State 안전성

- State 명령 전 `terraform state pull`로 Backup을 남긴다.
- 변경 후 `state list`와 `state show`로 Address 및 원격 ID를 확인한다.
- 민감 정보가 포함될 수 있는 State Backup은 Git에 커밋하지 않는다.
