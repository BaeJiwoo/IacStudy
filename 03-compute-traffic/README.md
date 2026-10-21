# 과제 03 컴퓨팅과 트래픽 분산

워크로드 요구사항에 맞는 컴퓨팅 서비스를 선택하고, 사용자 요청을 여러 Availability Zone의 정상 인스턴스로 분산한다.

## 선행 과제

- `02-vpc-networking`

## 진행 순서

1. [research.md](./research.md)에서 EC2, ECS, EKS와 Lambda를 비교한다.
2. [service-comparison.md](./service-comparison.md)에 선택 근거를 작성한다.
3. [capacity-plan.md](./capacity-plan.md)에 정상 및 AZ 장애 시 용량을 계산한다.
4. [request-flow.mmd](./request-flow.mmd)에 DNS부터 Compute까지 요청 흐름을 완성한다.

[keywords.md](./keywords.md), [assignment.md](./assignment.md), [tests/README.md](./tests/README.md)와 [checklist.md](./checklist.md)를 사용하고 결과는 `submission/`에 기록한다.

## 과제

결제 API는 Container Image로 배포되고 평상시 초당 요청 수는 100, 최대는 500이다. 한 AZ가 중단돼도 정상 트래픽을 처리해야 하며 운영 인력은 Kubernetes를 직접 관리할 여유가 없다.

- 컴퓨팅 플랫폼을 선택한다.
- Load Balancer, Target Group과 Health Check를 설계한다.
- Auto Scaling 지표와 최소 및 최대 용량을 정한다.
- Rolling, Blue Green 또는 Canary 배포 방식을 선택한다.

## 완료 기준

- [ ] 컴퓨팅 서비스 선택을 운영 부담과 요구사항으로 설명했다.
- [ ] Health Check 실패가 트래픽과 Auto Scaling에 미치는 영향을 설명했다.
- [ ] 한 AZ 장애 후에도 목표 처리량을 만족하는 용량을 계산했다.
- [ ] 배포 실패 시 트래픽 전환 또는 복구 방법이 있다.
