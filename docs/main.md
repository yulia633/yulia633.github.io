# Общее

Сервис работает как:

- **WEB-приложение**;
- **API-приложение**.

## Описание стандартного процесса работы

1. Пользователь заводит организацию, в которой указывает данные о сотруднике.
2. Если сотрудник ранее не был связан ни с одной организацией: то реквизиты вводятся как есть. И привязка осуществляется
по связи: сотрудник -> организация.
3. Если сотрудник ранее был указан в одной из организаций, то его реквизиты подтягиваются из системы. У сотрудника
добавляется новая организация. Сотрудник может состоять в нескольких организациях одновременно. При этом, если в реквизитах
пришли новые данные, они обновляются.

