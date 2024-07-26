# Person

```shell
Person(
  required Guid guid,
  required FullName fullName,
  optional string innFl,
  optional Gender? gender,
  optional string citizenship,
  optional DateTime? birthDate,
  optional string birthPlace,
  optional string phone,
  optional string email,
  optional ExtendedAddress registrationAddress,
  optional IdentityCard identityCard,
  optional string foreignAddress
)
```

Сущность `Person` (Employee) содержит информацию о сотруднике организации.
Возвращается методами: [GetPerson](../employee/get-person.md), [CreatePerson](../employee/create-person.md).

Данные хранятся в таблице в `employee.persons`.

### Описание полей

* guid - идентификатор сотрудника;
* fullName - полное имя сотрудника, состоящее из фамилии, имени и отчества, представленные структурой `FullName`;
* innFl - инн;
* gender - пол, представлен структурой `Gender`;
* citizenship - гражданство;
* birthDate - дата рождения;
* birthPlace - место рождения;
* phone - телефон;
* email - электронная почта;
* registrationAddress - адрес регистрации, представлен структурой `ExtendedAddress`;
* identityCard - документ, удостоверяющий личность, представлен структурой `IdentityCard`;
* foreignAddress - иностранный адрес регистрации.
