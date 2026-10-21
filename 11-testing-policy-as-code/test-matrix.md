# 인프라 테스트 매트릭스

| 대상 | 입력 | 예상 결과 | 테스트 계층 | 실제 리소스 생성 | 정리 확인 |
| --- | --- | --- | --- | --- | --- |
| VPC CIDR | 정상 CIDR | 통과 | Variable Validation | 아니요 | 해당 없음 |
| VPC CIDR | 잘못된 CIDR | 실패 | Variable Validation | 아니요 | 해당 없음 |
| Required Tags | Owner 누락 | 실패 | Plan Policy | 아니요 | 해당 없음 |
| SSH Ingress | 0.0.0.0/0 | 실패 | Static 또는 Plan Policy | 아니요 | 해당 없음 |
| Module Integration | 정상 입력 | 통과 | Terraform Test Apply | 예 |  |

## 정책 예외

- 정책 ID:
- 요청자:
- 사유:
- 영향 범위:
- 승인자:
- 만료일:
- 제거 확인:
