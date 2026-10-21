# 과제 05 멀티 계정과 보안 구조

AWS Account를 권한, 비용과 장애 영향의 경계로 사용하고 중앙 보안 서비스를 적절한 계정에 배치한다.

## 선행 과제

- `01-aws-resource-structure`

## 진행 순서

1. [research.md](./research.md)에서 Organizations와 AWS Security Reference Architecture를 조사한다.
2. [account-matrix.md](./account-matrix.md)에 계정별 책임을 정의한다.
3. [policy-comparison.md](./policy-comparison.md)에 권한 정책 종류를 비교한다.
4. [trust-boundary.mmd](./trust-boundary.mmd)에 사람과 자동화의 접근 경로를 그린다.

[keywords.md](./keywords.md), [assignment.md](./assignment.md), [tests/README.md](./tests/README.md)와 [checklist.md](./checklist.md)를 사용하고 결과는 `submission/`에 기록한다.

## 과제

Management, Security, Log Archive, Network, Shared Services, Development와 Production 계정을 설계한다. 사람의 접근은 IAM Identity Center, 자동화는 CI 역할과 Cross Account 역할을 사용한다.

## 완료 기준

- [ ] 각 계정의 소유자와 허용 워크로드를 정의했다.
- [ ] Management 계정에 일반 워크로드를 두지 않았다.
- [ ] SCP와 IAM Policy가 권한을 부여하는 방식의 차이를 설명했다.
- [ ] 중앙 보안 및 감사 로그의 수집 계정과 접근 권한을 정했다.
- [ ] 비상 접근의 승인과 사후 검토 절차가 있다.
