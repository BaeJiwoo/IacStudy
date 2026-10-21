# 과제 04 데이터와 저장소

데이터 접근 패턴과 복구 목표에 따라 저장소를 선택하고, 고가용성, 읽기 확장과 재해 복구를 구분한다.

## 선행 과제

- `01-aws-resource-structure`
- `02-vpc-networking`

## 진행 순서

1. [research.md](./research.md)의 저장소 특성을 조사한다.
2. [data-selection.md](./data-selection.md)에 데이터별 저장소를 선택한다.
3. [recovery-plan.md](./recovery-plan.md)에 RTO, RPO와 복원 절차를 작성한다.
4. [data-flow.mmd](./data-flow.mmd)에 데이터와 암호화 경계를 표시한다.

## 과제

결제 API의 거래 데이터, 영수증 파일, Container 공유 파일과 Session Cache를 저장할 서비스를 선택한다. 거래 데이터의 목표 RPO는 5분, 목표 RTO는 30분으로 가정한다.

## 완료 기준

- [ ] 각 데이터의 접근 방식과 일관성 요구를 기록했다.
- [ ] Multi AZ, Read Replica와 Backup의 목적을 구분했다.
- [ ] 저장 및 전송 중 암호화와 Key 소유권을 정했다.
- [ ] Backup 복원 시험 절차와 성공 기준이 있다.
