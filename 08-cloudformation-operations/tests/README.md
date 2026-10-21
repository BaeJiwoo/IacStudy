# 검증 시나리오

## Change Set

- 태그 추가가 `Modify`로 표시되는지 확인한다.
- VPC CIDR처럼 변경할 수 없는 속성의 교체 또는 실패 가능성을 확인한다.
- 빈 Change Set을 자동화가 정상 종료로 처리할지 정책을 정한다.

## Guard

- 기본 Template이 모든 규칙을 통과해야 한다.
- Versioning을 `Suspended`로 변경하면 Versioning 규칙이 실패해야 한다.
- Public Access Block 속성 하나를 `false`로 변경하면 공개 차단 규칙이 실패해야 한다.

## StackSets와 Drift

- 허용 실패 수를 초과했을 때 새 Target 배포가 중지되는지 설명한다.
- 관리 대상 태그의 수동 변경이 Drift로 표시되는지 확인한다.
- `DeletionPolicy: Retain`으로 남은 Bucket의 소유권과 제거 절차를 기록한다.
