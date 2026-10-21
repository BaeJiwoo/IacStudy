# 조사 자료와 질문

## 공식 자료

- [기존 Resource Import](https://developer.hashicorp.com/terraform/language/import)
- [Import Block](https://developer.hashicorp.com/terraform/language/block/import)
- [Refactoring](https://developer.hashicorp.com/terraform/language/modules/develop/refactoring)
- [Moved Block](https://developer.hashicorp.com/terraform/language/block/moved)
- [Removed Block](https://developer.hashicorp.com/terraform/language/block/removed)
- [Lifecycle Meta Argument](https://developer.hashicorp.com/terraform/language/meta-arguments/lifecycle)
- [State 명령](https://developer.hashicorp.com/terraform/cli/commands/state)

## 조사 질문

1. Import가 State와 Configuration에 각각 어떤 변화를 주는가.
2. 같은 원격 객체를 둘 이상의 Resource Address로 Import하면 왜 안 되는가.
3. Import 직후 Plan에 많은 변경이 나타나는 이유는 무엇인가.
4. `moved` Block과 `terraform state mv`는 협업 및 코드 검토 측면에서 어떻게 다른가.
5. `ignore_changes`가 Drift를 숨길 수 있는 사례는 무엇인가.
6. `prevent_destroy`만으로 Console 또는 다른 Stack의 삭제를 막을 수 있는가.
7. Provider Alias를 Module에 전달할 때 State Address와 Provider 구성이 어떻게 연결되는가.
