# 거버넌스 통제 배치

| 요구사항 | 빠른 피드백 | 배포 전 차단 | 조직 경계 | 사후 탐지 | 예외 승인 |
| --- | --- | --- | --- | --- | --- |
| S3 공개 차단 | Guard 또는 Checkov | CloudFormation Hook | SCP 검토 | Config Rule | 보안팀 승인 |
| 필수 태그 | Lint 또는 Test | Pipeline Policy | Tag Policy | Config Rule | 비용 담당 승인 |
| 허용 Region | Unit Test | Pipeline Policy | SCP | CloudTrail 및 Config | 플랫폼팀 승인 |
| Production 삭제 | Plan 검사 | Approval Gate | IAM 및 SCP | CloudTrail 경보 | 서비스 소유자 승인 |
| 암호화 필수 | Guard 또는 Checkov | Hook | SCP 가능성 검토 | Config Rule | 보안팀 승인 |

각 행에서 실제로 사용할 통제만 남기고, 같은 실패를 여러 단계에서 검사하는 이유가 없다면 중복을 제거한다.
