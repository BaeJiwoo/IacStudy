# 과제 08 CloudFormation 운영

## 목표

CloudFormation 변경을 실행 전에 검토하고, 중요한 리소스를 보호하며, 여러 Account와 Region에 표준 구성을 배포한다. 정책 위반, Drift와 Rollback 실패를 운영 절차로 다룬다.

## 선행 과제

- `07-cloudformation-basics`
- `05-multi-account-security`

## 준비된 파일

- [keywords.md](./keywords.md): 운영 핵심 용어
- [research.md](./research.md): 공식 자료와 조사 질문
- [assignment.md](./assignment.md): Change Set부터 복구까지의 실습
- [starter/create-change-set.sh](./starter/create-change-set.sh): Change Set 생성 시작 Script
- [starter/stack-policy.json](./starter/stack-policy.json): 중요 리소스 갱신 제한 예제
- [starter/baseline-stackset.yaml](./starter/baseline-stackset.yaml): StackSets용 기본 보안 Template
- [starter/s3-security.guard](./starter/s3-security.guard): CloudFormation Guard 규칙
- [tests/README.md](./tests/README.md): 정상 및 실패 검증
- [checklist.md](./checklist.md): 완료 기준

## 핵심 결과물

1. Change Set 검토 기록과 승인 기준
2. Stack Policy와 정책 예외 처리 절차
3. StackSets 배포 및 실패 허용 설계
4. Drift 탐지와 `UPDATE_ROLLBACK_FAILED` 복구 Runbook
