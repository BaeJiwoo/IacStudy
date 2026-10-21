# 과제 14 OIDC와 Cross Account 배포

정적 AWS Access Key 없이 CI가 STS 임시 자격 증명을 얻고, 대상 계정의 배포 역할을 인수하도록 구성한다.

## 선행 과제

- `05-multi-account-security`
- `13-pr-plan-pipeline`

## 시작 파일

- [starter/main.tf](./starter/main.tf): GitHub OIDC 역할 시작 코드
- [starter/variables.tf](./starter/variables.tf): 저장소와 Branch 제한 입력
- [starter/outputs.tf](./starter/outputs.tf): CI 역할 ARN
- [starter/trust-policy.json](./starter/trust-policy.json): 대상 계정 역할의 Trust Policy 예제

## 과제

1. [research.md](./research.md)의 OIDC, STS와 Trust Policy를 조사한다.
2. Tooling 계정에 GitHub OIDC Provider와 CI 역할을 만든다.
3. Trust Policy를 Organization, Repository와 Branch 또는 Environment로 제한한다.
4. Development와 Production 계정에 서로 다른 배포 역할을 만든다.
5. 허용되지 않은 Repository와 Branch에서 역할 인수가 거부되는지 확인한다.
6. CloudTrail에서 Commit SHA와 Run ID를 포함한 Role Session을 찾는다.

과제별 용어, 제출 형식과 검증 항목은 [keywords.md](./keywords.md), [assignment.md](./assignment.md), [tests/README.md](./tests/README.md)와 [checklist.md](./checklist.md)를 함께 사용한다.

## 완료 기준

- [ ] GitHub Secret에 AWS Access Key가 없다.
- [ ] OIDC Subject와 Audience 조건이 제한돼 있다.
- [ ] Plan 역할과 Production Apply 역할의 권한 차이를 설명했다.
- [ ] Cross Account Role의 Trust Policy와 Permission Policy를 구분했다.
- [ ] 허용 및 거부 테스트 증거를 남겼다.
