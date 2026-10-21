# AWS IaC 공식 학습 자료

공식 문서를 우선 사용하고 블로그나 예제 코드는 개념을 보완하는 용도로 사용한다. 서비스 기능과 권장사항은 변경될 수 있으므로 실제 구현 전에 현재 문서를 다시 확인한다.

## AWS 계정과 거버넌스

- [AWS Region과 Availability Zone](https://docs.aws.amazon.com/global-infrastructure/latest/regions/aws-regions-availability-zones.html)
- [AWS Well Architected Framework](https://docs.aws.amazon.com/wellarchitected/latest/framework/welcome.html)
- [AWS Control Tower 멀티 계정 전략](https://docs.aws.amazon.com/controltower/latest/userguide/aws-multi-account-landing-zone.html)
- [AWS 멀티 계정 환경 구성](https://docs.aws.amazon.com/whitepapers/latest/organizing-your-aws-environment/)
- [AWS Organizations 설정 지침](https://docs.aws.amazon.com/prescriptive-guidance/latest/transitioning-to-multiple-aws-accounts/set-up-organization.html)
- [AWS Control Tower Controls](https://docs.aws.amazon.com/prescriptive-guidance/latest/designing-control-tower-landing-zone/controls.html)
- [AWS Control Tower Account Factory for Terraform](https://docs.aws.amazon.com/controltower/latest/userguide/aft-overview.html)

AFT는 AWS 계정 프로비저닝과 계정별 표준 설정을 자동화하는 용도다. 애플리케이션에 필요한 EC2, ECS와 같은 워크로드 리소스의 일반 배포 파이프라인과 역할이 다르다.

## AWS 아키텍처

- [AWS Security Reference Architecture](https://docs.aws.amazon.com/prescriptive-guidance/latest/security-reference-architecture/introduction.html)
- [확장 가능하고 안전한 멀티 VPC 네트워크](https://docs.aws.amazon.com/whitepapers/latest/building-scalable-secure-multi-vpc-network-infrastructure/)
- [Amazon VPC 사용 설명서](https://docs.aws.amazon.com/vpc/latest/userguide/what-is-amazon-vpc.html)
- [Elastic Load Balancing 아키텍처](https://docs.aws.amazon.com/elasticloadbalancing/latest/userguide/how-elastic-load-balancing-works.html)
- [Amazon RDS Multi AZ 배포](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Concepts.MultiAZ.html)

## Terraform

- [기존 Resource Import](https://developer.hashicorp.com/terraform/language/import)
- [Module Refactoring](https://developer.hashicorp.com/terraform/language/modules/develop/refactoring)
- [Lifecycle Meta Argument](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)
- [Terraform S3 Backend](https://developer.hashicorp.com/terraform/language/backend/s3)
- [Terraform Test 명령](https://developer.hashicorp.com/terraform/cli/commands/test)
- [Terraform Testing 기능](https://developer.hashicorp.com/terraform/cli/test)
- [AWS의 Terraform Provider 권장사항](https://docs.aws.amazon.com/prescriptive-guidance/latest/terraform-aws-provider-best-practices/introduction.html)
- [AWS의 Terraform 보안 권장사항](https://docs.aws.amazon.com/prescriptive-guidance/latest/terraform-aws-provider-best-practices/security.html)

## 인증과 권한

- [AWS IAM OIDC 역할 생성](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_create_for-idp_oidc.html)
- [IAM 최소 권한 권장사항](https://docs.aws.amazon.com/IAM/latest/UserGuide/best-practices.html)

## CloudFormation과 CDK

- [CloudFormation 작동 방식](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-overview.html)
- [CloudFormation Template 구조](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/template-anatomy.html)
- [CloudFormation Change Sets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-changesets.html)
- [CloudFormation Drift Detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html)
- [CloudFormation StackSets Drift Detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html)
- [CloudFormation Guard](https://docs.aws.amazon.com/cfn-guard/latest/ug/what-is-guard.html)
- [CloudFormation Hooks](https://docs.aws.amazon.com/cloudformation-cli/latest/hooks-userguide/what-is-cloudformation-hooks.html)
- [AWS CDK Stack Synthesis](https://docs.aws.amazon.com/cdk/v2/guide/configure-synth.html)
- [AWS CDK 배포 과정](https://docs.aws.amazon.com/cdk/v2/guide/deploy.html)
- [AWS SAM 사용](https://docs.aws.amazon.com/serverless-application-model/latest/developerguide/chapter-using-sam.html)

## 조직 플랫폼

- [Service Catalog 개념](https://docs.aws.amazon.com/servicecatalog/latest/adminguide/what-is_concepts.html)
- [Service Catalog Constraint](https://docs.aws.amazon.com/servicecatalog/latest/adminguide/constraints.html)
- [Control Tower 개요](https://docs.aws.amazon.com/controltower/latest/userguide/what-is-control-tower.html)
- [Account Factory for Terraform](https://docs.aws.amazon.com/controltower/latest/userguide/aft-overview.html)

## CI/CD와 정책

- [AWS Cloud Adoption Framework CI/CD 지침](https://docs.aws.amazon.com/prescriptive-guidance/latest/aws-caf-platform-perspective/ci-cd.html)
- [중앙화된 Checkov 정책 검사 패턴](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/centralized-custom-checkov-scanning.html)
- [Terraform을 이용한 AWS Control Tower Control 관리](https://docs.aws.amazon.com/prescriptive-guidance/latest/patterns/deploy-and-manage-aws-control-tower-controls-by-using-terraform.html)

## 추천 읽기 순서

1. Region과 Availability Zone, VPC와 Well Architected Framework
2. 멀티 계정 전략과 AWS Security Reference Architecture
3. CloudFormation Template, Change Set, StackSets와 Drift Detection
4. CDK Synthesis와 AWS SAM
5. Terraform 기본, Import, Refactoring과 S3 Backend
6. IAM OIDC 역할과 Terraform 보안 권장사항
7. CI/CD, Guard와 Checkov 정책 검사
8. Service Catalog, AFT와 Control Tower Control 관리
