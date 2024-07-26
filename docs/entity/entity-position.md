# Position

```shell
Position(
  required Guid person,
  required Guid organization,
  optional string title
)
```

Сущность `Position` содержит информацию о должности сотрудника организации.

Данные хранятся в таблице в `employee.positions`.

### Описание полей

* person - идентификатор сотрудника, представленый в формате `guid`;
* organization - идентификатор организации, представленый в формате `guid`;
* title - название должности.
