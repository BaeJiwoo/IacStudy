# 과제 06 관측성과 Well Architected 검토

워크로드의 정상 상태와 변경 이력을 관찰할 수 있는 구조를 설계하고, AWS Well Architected의 여섯 관점으로 현재 아키텍처를 검토한다.

## 선행 과제

- `03-compute-traffic`
- `04-data-storage`
- `05-multi-account-security`

## 진행 순서

1. [research.md](./research.md)에서 관측성 서비스와 Well Architected를 조사한다.
2. [signals.md](./signals.md)에 Metrics, Logs, Traces와 Events를 정의한다.
3. [review.md](./review.md)에 위험과 개선 우선순위를 기록한다.
4. [architecture.mmd](./architecture.mmd)에 지금까지 설계한 모든 계층을 합친다.

## 과제

결제 API의 사용자 오류율, 지연 시간, 처리량과 리소스 포화도를 측정한다. CloudTrail과 AWS Config를 이용해 구성 변경을 추적하고, 보안 로그를 중앙 계정으로 수집한다. 완성된 아키텍처를 Well Architected 여섯 Pillar로 검토한다.

## 완료 기준

- [ ] 사용자 영향과 연결되는 지표 및 경보를 정의했다.
- [ ] 기술 로그와 감사 로그의 보존 위치 및 권한을 구분했다.
- [ ] 특정 장애에서 애플리케이션 로그와 AWS 변경 이벤트까지 추적할 수 있다.
- [ ] 여섯 Pillar마다 최소 하나의 위험과 개선 항목을 작성했다.
- [ ] 아키텍처 경계를 이후 Terraform Module과 State 단위에 매핑했다.
