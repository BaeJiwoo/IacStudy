# AWS IaC 자동 배포 서비스 최종 프로젝트

최종 프로젝트는 사용자가 표준화된 인프라 요청을 제출하면 Git 변경, Plan, 정책 검사, 승인, Apply, 검증과 감사까지 수행하는 셀프서비스 배포 플랫폼이다. 프로젝트의 핵심 평가는 리소스를 생성하는 기능보다 변경을 안전하게 통제하고 추적하는 능력에 둔다.

## 프로젝트 목표

- 사용자가 Terraform을 직접 작성하지 않아도 승인된 Module을 사용할 수 있다.
- 모든 인프라 변경은 Git과 Pull Request에 기록된다.
- 운영 변경은 Plan과 정책 검사를 통과하고 별도 승인을 받아야 한다.
- CI/CD는 OIDC와 STS 임시 자격 증명을 사용한다.
- 배포 결과와 AWS API 활동을 하나의 Request ID로 추적한다.
- IaC 밖에서 발생한 변경을 탐지한다.

## 기준 아키텍처

```text
사용자 또는 CLI
      │
      ▼
API Gateway 또는 ALB
      │
      ▼
배포 요청 서비스 ───────────────► 요청 메타데이터 저장소
      │                                  │
      │ 요청 검증                        │ 상태와 감사 이벤트
      ▼                                  │
Git Pull Request                         │
      │                                  │
      ▼                                  │
CI Plan ──► Test ──► Security ──► Policy │
      │                                  │
      ▼                                  │
운영 승인                                │
      │                                  │
      ▼                                  │
SQS 또는 Workflow Orchestrator           │
      │                                  │
      ▼                                  │
격리된 Terraform Worker                  │
      │ OIDC와 AssumeRole                 │
      ▼                                  │
대상 AWS 계정 ──► 검증 ──► 로그와 지표 ──┘
```

## 권장 기술 기준

| 영역 | 기본 선택 | 대안 |
| --- | --- | --- |
| IaC | Terraform | OpenTofu, CloudFormation, AWS CDK |
| Git | GitHub | GitLab, CodeConnections 연동 저장소 |
| CI | GitHub Actions | GitLab CI, CodePipeline와 CodeBuild |
| API | API Gateway와 Lambda | ALB와 ECS |
| 요청 저장 | DynamoDB | PostgreSQL |
| 비동기 처리 | SQS | EventBridge |
| 워크플로 | Step Functions | CI 워크플로 자체 사용 |
| 실행 워커 | CodeBuild | ECS Task, Kubernetes Job |
| State | S3와 KMS, S3 Lockfile | HCP Terraform |
| 보안 검사 | Checkov와 TFLint | tfsec, Terrascan |
| 정책 검사 | OPA와 Conftest | Sentinel, CloudFormation Guard |
| 관측성 | CloudWatch와 CloudTrail | 조직의 중앙 관측성 플랫폼 |

도구 선택은 평가 항목이 아니다. 인증, 격리, 승인, 추적과 실패 처리가 설명 가능하고 재현 가능해야 한다.

## 사용자 요청 예제

```yaml
apiVersion: platform.example.io/v1
kind: EcsService

metadata:
  name: payment-api
  owner: payment-team
  costCenter: fintech

spec:
  environment: dev
  accountId: "111122223333"
  region: ap-northeast-2
  moduleVersion: "1.2.0"

  network:
    vpcId: vpc-0123456789abcdef0
    public: false

  compute:
    cpu: 512
    memory: 1024
    desiredCount: 2

  observability:
    logRetentionDays: 30
    alarms: true
```

요청 스키마는 허용 가능한 값과 상한을 제한해야 한다. `accountId`, `region`, Module 버전과 공개 여부는 자유 형식 문자열로 신뢰하지 않고 플랫폼이 관리하는 Catalog와 비교한다.

## 배포 상태 모델

```text
REQUESTED
  → VALIDATING
  → CREATING_CHANGE
  → PLANNING
  → POLICY_CHECK
  → WAITING_APPROVAL
  → APPLY_QUEUED
  → APPLYING
  → VERIFYING
  → SUCCEEDED
```

각 단계는 `FAILED` 또는 `CANCELLED`로 전이할 수 있어야 한다. 재시도는 실패 원인과 실제 AWS 및 State 상태를 확인한 뒤 새로운 실행으로 기록한다. 기존 실패 기록을 성공으로 덮어쓰지 않는다.

## 최소 데이터 모델

| 필드 | 설명 |
| --- | --- |
| `request_id` | 전체 흐름을 연결하는 고유 식별자 |
| `idempotency_key` | 중복 요청 방지 키 |
| `project` | 비용과 소유권을 구분하는 프로젝트 |
| `account_id` | 배포 대상 AWS 계정 |
| `environment` | 개발, 검증 또는 운영 환경 |
| `region` | 배포 대상 AWS 리전 |
| `module_name` | 허용된 Module 이름 |
| `module_version` | 고정된 Module 버전 |
| `state_key` | 대상 Terraform State 식별자 |
| `commit_sha` | 검토 및 실행 대상 Commit |
| `plan_digest` | 승인한 Plan을 확인하는 해시 |
| `requester` | 요청자 |
| `approver` | 승인자 |
| `status` | 현재 상태 |
| `run_id` | CI 또는 Worker 실행 ID |
| `created_at` | 요청 생성 시각 |
| `updated_at` | 마지막 상태 변경 시각 |

## 최소 API

| Method | Path | 기능 |
| --- | --- | --- |
| `POST` | `/deployments` | 배포 요청 생성 |
| `GET` | `/deployments/{id}` | 요청 상태와 단계별 결과 조회 |
| `POST` | `/deployments/{id}/cancel` | 실행 전 요청 취소 |
| `GET` | `/deployments/{id}/plan` | 권한이 있는 사용자에게 Plan 요약 제공 |
| `GET` | `/modules` | 사용 가능한 표준 Module과 버전 조회 |

승인은 Git 제공자의 보호 규칙 또는 별도 승인 API 중 하나를 선택한다. 별도 승인 API를 만들 경우 요청자가 자신의 운영 배포를 승인하지 못하도록 권한을 분리한다.

## Pipeline 요구사항

### Plan 단계

1. 요청과 Git Commit을 검증한다.
2. Terraform과 Provider 버전을 확인한다.
3. `fmt`, `validate`, lint와 Module 테스트를 실행한다.
4. 보안 검사와 Policy as Code를 실행한다.
5. Plan 파일과 JSON 요약을 생성한다.
6. 생성, 변경, 교체, 삭제 수를 Pull Request에 표시한다.
7. Plan 아티팩트를 암호화하고 짧은 보존 기간을 설정한다.
8. Plan Digest와 Commit SHA를 요청 메타데이터에 저장한다.

### Apply 단계

1. 승인 상태와 승인자를 확인한다.
2. 현재 Commit이 승인된 Commit과 같은지 확인한다.
3. Plan Digest가 승인 당시 값과 같은지 확인한다.
4. 대상 계정과 State Key에 실행 잠금을 획득한다.
5. OIDC로 CI 역할을 얻고 대상 계정 역할을 인수한다.
6. 승인된 Plan을 Apply한다.
7. 실제 리소스와 주요 상태를 검증한다.
8. 로그, 지표와 감사 이벤트를 기록한다.
9. 실행 잠금을 해제한다.

## MVP 범위

MVP는 한 종류의 표준 Module과 개발 및 운영 두 환경을 지원한다.

- VPC 또는 ECS Service Module 하나
- YAML 요청 검증
- Git Pull Request 생성 또는 변경 제출
- Pull Request Plan
- TFLint와 Checkov 검사
- 필수 태그와 운영 삭제 금지 정책
- 개발 자동 승인과 운영 수동 승인
- GitHub OIDC 기반 Cross Account Apply
- 실행 상태 조회
- CloudWatch 로그와 기본 지표
- 주기적 Drift 검사

## 확장 범위

MVP 완료 후 다음 기능을 우선순위에 따라 추가한다.

- Module Catalog와 버전 승격
- 임시 Preview 환경과 만료 시간
- 비용 예상 및 임계값 정책
- 여러 리전 배포
- 배포 창과 변경 동결 기간
- 정책 예외 승인과 자동 만료
- 자동 계정 프로비저닝 연동
- 웹 포털과 실시간 상태 알림
- OpenTelemetry 기반 분산 추적

## 저장소 예시

```text
aws-iac-deployment-platform/
├─ README.md
├─ docs/
│  ├─ architecture.md
│  ├─ security.md
│  ├─ state-management.md
│  └─ runbooks/
├─ modules/
│  ├─ vpc/
│  └─ ecs-service/
├─ environments/
│  ├─ dev/
│  └─ prod/
├─ policy/
│  ├─ security/
│  └─ organization/
├─ service/
│  ├─ api/
│  └─ worker/
├─ requests/
│  ├─ schema/
│  └─ examples/
├─ tests/
│  ├─ unit/
│  └─ integration/
└─ .github/workflows/
   ├─ plan.yml
   ├─ apply.yml
   └─ drift.yml
```

## 품질 속성

### 보안

- 정적 AWS Access Key를 저장하지 않는다.
- 모든 AWS 역할은 최소 권한과 제한된 Trust Policy를 사용한다.
- State, Plan과 로그의 읽기 권한을 분리한다.
- 사용자 입력을 파일 경로, Shell 명령 또는 Terraform 표현식으로 직접 연결하지 않는다.
- Worker는 요청별로 격리하고 실행 후 작업 공간을 제거한다.

### 신뢰성

- 동일 요청을 재전송해도 Apply가 중복 실행되지 않는다.
- 동일 State에 대한 Apply는 직렬화한다.
- Worker가 중단돼도 요청 상태가 유실되지 않는다.
- 재시도 가능 오류와 수동 확인이 필요한 오류를 구분한다.

### 운영성

- 요청부터 AWS API 호출까지 상관관계를 추적할 수 있다.
- 실패 메시지는 실패 단계와 수정 방법을 제공한다.
- 주요 장애 시나리오에 Runbook이 있다.
- Module과 Pipeline 변경은 버전 관리와 코드 리뷰를 거친다.

## 인수 기준

- [ ] 개발 환경 요청이 승인된 Module을 사용해 성공적으로 배포된다.
- [ ] 운영 환경 요청은 요청자와 다른 승인자가 필요하다.
- [ ] 허용되지 않은 브랜치에서는 AWS 역할 인수가 실패한다.
- [ ] 공개 S3 또는 `0.0.0.0/0` 관리 포트가 정책 검사에서 차단된다.
- [ ] 승인 뒤 Commit 또는 Plan이 바뀌면 Apply가 거부된다.
- [ ] 같은 State에 대한 동시 Apply가 차단된다.
- [ ] 실패한 요청이 성공 기록으로 덮어써지지 않는다.
- [ ] 특정 리소스를 Request ID와 Commit SHA까지 역추적할 수 있다.
- [ ] 콘솔 수동 변경이 Drift 검사에서 탐지된다.
- [ ] 데이터 리소스 삭제에는 별도 보호 및 승인 절차가 적용된다.
- [ ] 프로젝트 제거 절차와 비용 확인 절차가 문서화돼 있다.

