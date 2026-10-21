# 과제 16 Service Catalog와 Control Tower

## 목표

조직이 승인한 인프라 제품을 사용자가 안전하게 셀프서비스로 배포하도록 설계한다. Service Catalog의 제품 공급과 Control Tower 및 AFT의 계정 공급을 구분하고, 중앙 통제와 팀 자율성의 경계를 정한다.

## 선행 과제

- `05-multi-account-security`
- `08-cloudformation-operations`
- `09-cdk-and-sam`
- `15-testing-policy-as-code` 권장

## 준비된 파일

- [keywords.md](./keywords.md): 조직 플랫폼 핵심 용어
- [research.md](./research.md): 공식 자료와 조사 질문
- [assignment.md](./assignment.md): 표준 제품과 계정 공급 설계
- [governance-map.md](./governance-map.md): 예방, 탐지와 대응 통제 배치표
- [starter/product-template.yaml](./starter/product-template.yaml): 승인 제품의 실제 Provisioning Template
- [starter/portfolio.yaml](./starter/portfolio.yaml): Portfolio와 Product 등록 시작 Template
- [starter/aft-account-request.tf.example](./starter/aft-account-request.tf.example): AFT 계정 요청 예제
- [tests/README.md](./tests/README.md): 검증 및 실패 시나리오
- [checklist.md](./checklist.md): 완료 기준

## 핵심 결과물

1. Service Catalog Product와 Portfolio 설계
2. Launch Constraint 및 사용자 권한 경계
3. Control Tower Control과 Policy as Code 배치표
4. AFT 계정 요청 및 Customization 흐름
