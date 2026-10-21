# 실습 과제

## 1 기존 Resource 조사

Sandbox에서 실습용 S3 Bucket 하나를 CLI 또는 Console로 만든다. 이름, Region, 암호화, Versioning, Public Access Block, 태그와 의존 Resource를 기록한다. 기존 운영 Resource는 사용하지 않는다.

## 2 선언형 Import

[starter](./starter/)의 `terraform.tfvars.example`을 복사하고 실습 Bucket 이름을 입력한다.

```bash
cd starter
terraform init
terraform plan
terraform apply
```

Import 전에는 `1 to import`와 함께 어떤 Update가 계획되는지 확인한다. Configuration을 실제 설정과 맞춰 Import 이후 Plan이 변경 없음이 될 때까지 조정한다.

## 3 Resource Address 변경

Resource 이름을 `aws_s3_bucket.imported`에서 `aws_s3_bucket.logs`로 변경하고 [moved.tf.example](./examples/moved.tf.example)을 참고해 `moved` Block을 추가한다. Plan이 삭제와 생성을 제안하지 않아야 한다.

## 4 보호와 제거

1. `prevent_destroy`를 제거하지 않은 상태에서 Destroy가 차단되는지 확인한다.
2. [removed.tf.example](./examples/removed.tf.example)을 검토하고 Resource를 삭제하지 않은 채 Terraform 관리에서 제외하는 절차를 설계한다.
3. State 변경 전 Backup, 승인, 실행 후 검증과 Rollback 절차를 작성한다.

마지막에는 Terraform 관리 상태를 명확히 확인한 후 실습 Bucket을 비우고 제거한다.
