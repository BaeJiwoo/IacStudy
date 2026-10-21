# 과제 08 Module과 원격 State

과제 07의 VPC를 재사용 가능한 Module로 분리하고, 협업에 필요한 원격 State와 잠금을 구성한다.

## 선행 과제

- `07-terraform-basics`

## 시작 파일

```text
08-modules-remote-state/
├─ bootstrap/              # State Bucket을 한 번 생성하는 코드
├─ modules/vpc/            # 재사용할 VPC Module
└─ live/dev/               # 개발 환경 Root Module
```

## 진행 순서

1. [research.md](./research.md)에서 Module과 Backend를 조사한다.
2. `bootstrap`의 TODO를 완성하고 State Bucket을 생성한다.
3. Bucket Versioning, 암호화, Public Access Block과 삭제 보호를 검증한다.
4. `modules/vpc`에 과제 07 코드를 옮기고 입력 및 출력을 정리한다.
5. `live/dev/backend.tf.example`을 `backend.tf`로 복사해 실제 값으로 수정한다.
6. 두 Plan을 동시에 실행해 S3 Lockfile 동작을 검증한다.
7. 이전 S3 Object Version에서 State를 복구하는 Runbook을 작성한다.

## 완료 기준

- [ ] Module과 Root Module의 책임이 분리돼 있다.
- [ ] State Bucket에 Versioning과 암호화가 적용됐다.
- [ ] `use_lockfile = true`로 동시 실행이 차단된다.
- [ ] 개발과 운영 State 경로 및 접근 권한을 분리할 방법을 설명했다.
- [ ] State 복구와 Force Unlock 절차를 검증했다.
