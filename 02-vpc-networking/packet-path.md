# 네트워크 패킷 경로

## 사용자 요청 경로

```text
사용자
→ DNS
→
→
→ Application
```

각 단계에서 확인할 Route와 보안 규칙:

1.
2.
3.

## Application의 인터넷 Egress

```text
Application
→
→
→ Internet
```

## Application의 AWS 서비스 접근

```text
Application
→
→ S3 또는 Secrets Manager
```

## 문제 해결 순서

- [ ] DNS가 예상 주소를 반환하는가
- [ ] Source Subnet의 Route가 올바른가
- [ ] Security Group이 요청과 응답을 허용하는가
- [ ] Network ACL이 양방향 포트를 허용하는가
- [ ] 대상 서비스 정책 또는 IAM이 요청을 허용하는가
