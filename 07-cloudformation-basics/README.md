# 과제 07 CloudFormation 기본

## 목표

CloudFormation Template의 구조를 이해하고 VPC Stack을 생성, 조회, 갱신, 삭제한다. 선언한 논리 ID와 AWS의 실제 물리 리소스가 Stack에서 어떻게 연결되는지 확인한다.

## 선행 과제

- `06-observability-well-architected`

## 준비된 파일

- [keywords.md](./keywords.md): 반드시 설명할 핵심 용어
- [research.md](./research.md): 공식 자료와 조사 질문
- [assignment.md](./assignment.md): 단계별 실습 과제
- [starter/template.yaml](./starter/template.yaml): 비용 부담이 적은 VPC Stack 시작 Template
- [starter/parameters.dev.json](./starter/parameters.dev.json): Development 입력 예제
- [tests/README.md](./tests/README.md): 검증 및 실패 시나리오
- [checklist.md](./checklist.md): 완료 기준
- `submission/`: 학습 내용, 결정과 실행 결과 기록

## 핵심 결과물

1. 검증을 통과한 CloudFormation Template
2. Stack 생성과 갱신 실행 기록
3. 논리 ID, 물리 ID와 의존 관계 설명
4. 실패 원인과 Rollback 상태 분석

## 비용 주의

시작 Template은 VPC, Subnet, Route Table과 Internet Gateway만 생성하며 NAT Gateway를 만들지 않는다. 실습 후 Stack을 삭제하고 리소스가 남지 않았는지 확인한다.
