# Role

```shell
Role(
  required Guid organization,
  required RoleType type,
  required Guid person,
  required Guid positionOrganization
)
```

Сущность `Role` содержит информацию о роли сотрудника организации.

Данные хранятся в таблице в `employee.roles`.

### Описание полей

* organization - идентификатор организации, представленый в формате `guid`;
* type - тип роли, представлен структурой `enum`;
* person - идентификатор сотрудника, представленый в формате `guid`;
* positionOrganization - идентификатор должность-организация, представленый в формате `guid`;

### Типы ролей

[Типы ролей](entity-role-type.md)
