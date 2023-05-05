---
layout: post
title:  "Генерируем Google-таблицу в Laravel используя google-api-php-client"
date:   2023-05-03 17:10:35 +0300
categories: Laravel
---

## Постановка задачи 💼
Необходимо создать Google-таблицу в ***Laravel***.

### Решение

Для работы с таблицами необходимо зарегистрироваться в Google. Затем настроить проект в сервисном аккаунте и установить библиотеку с помощью Composer.

Для генерации таблиц будем использовать библиотеку [google-api-php-client](https://github.com/googleapis/google-api-php-client/ "https://github.com/googleapis/google-api-php-client")

<br>

##### ▶ Шаг 1: Создать сервисный аккаунт

● Создать учетку в Google, создать проект.<br>
● Включить для созданного проекта Drive API и Sheets API.<br>
● Создать учётные данные и сохранить закрытый ключ.<br>

Зайти в [Google Developers Console](https://console.cloud.google.com/cloud-resource-manager "https://console.cloud.google.com/cloud-resource-manager")

Cоздать проект или использовать существующий.

<img src="/assets/create-project.png" width="600" alt="Ula" style="float: center; margin: 0 1.5em 15px 0; min-width: 650px; max-width: 45%" />

Введите имя проекта и нажмите Create project

<img src="/assets/create.png" width="600" alt="Ula" style="float: center; margin: 0 1.5em 15px 0; min-width: 450px; max-width: 45%" />


В обновленном списке проектов наведите на созданный проект

<img src="/assets/settings-1.png" width="1200" alt="Ula" style="float: center; margin: 0 1.5em 15px 0; min-width: 800px; max-width: 70%" />

И слева будут настройки прав доступа. В секции Owner вы должны увидеть своего пользователя. 

<img src="/assets/settings-2.png" width="600" alt="Ula" style="float: center; margin: 0 1.5em 15px 0; min-width: 450px; max-width: 45%" />

Если пользователя с ролью Владелец нет, то нажмите на Add Principal, внесите свой email с домена gmail.com и выберите группу Currently used - Owner. Сохраните изменения. Тем самым вы создали проект и сами себе выдали права.

<img src="/assets/settings-3.png" width="600" alt="Ula" style="float: center; margin: 0 1.5em 15px 0; min-width: 450px; max-width: 45%" />


Опять зайдите на страницу [Google Developers Console](https://console.cloud.google.com/cloud-resource-manager "https://console.cloud.google.com/cloud-resource-manager")


Выберите на своем проекте меню Settings.

<img src="/assets/settings-4.png" width="600" alt="Ula" style="float: center; margin: 0 1.5em 15px 0; min-width: 450px; max-width: 45%" />

И справа появится меню. Выберите Service account, а затем Create service accounts.

<img src="/assets/settings-5.png" width="600" alt="Ula" style="float: center; margin: 0 1.5em 15px 0; min-width: 600px; max-width: 45%" />


Введите название аккаунта и нажмите Create and continue

<img src="/assets/settings-6.png" width="600" alt="Ula" style="float: center; margin: 0 1.5em 15px 0; min-width: 450px; max-width: 45%" />


Выберите роль Owner и нажмите Continue

<img src="/assets/settings-7.png" width="600" alt="Ula" style="float: center; margin: 0 1.5em 15px 0; min-width: 450px; max-width: 45%" />

<br>

У вас появится созданный сервисный аккаунт. Нажмите в фильтре на email.
<img src="/assets/settings-9.png" width="600" alt="Ula" style="float: center; margin: 0 1.5em 15px 0; min-width: 550px; max-width: 45%" />

В появившемся окне настроек сервисного аккаунта перейдите на вкладку Keys.

<img src="/assets/settings-8.png" width="600" alt="Ula" style="float: center; margin: 0 1.5em 15px 0; min-width: 550px; max-width: 45%" />


Нажмите на кнопку Add key. Выберите тип ключа "json" и нажмите Сreate.
Будет создан и сразу скачан файл с ключами. Сохраните его. Он нам понадобится, чтобы получать доступ к сервисам Google.

<img src="/assets/settings-10.png" width="600" alt="Ula" style="float: center; margin: 0 1.5em 15px 0; min-width: 550px; max-width: 45%" />

Нажмите на иконку "бутерброд", слева от надписи Google APIs, выберите пункт APIs and services, и в нем подпункт Enabled APIs and services.

<img src="/assets/settings-11.png" width="600" alt="Ula" style="float: center; margin: 0 1.5em 15px 0; min-width: 550px; max-width: 45%" />


В открывшемся окне нажмите Enable APIs and services.

<img src="/assets/settings-12.png" width="600" alt="Ula" style="float: center; margin: 0 1.5em 15px 0; min-width: 250px; max-width: 45%" />


Далее нам необходимо будет подключить Google Drive API и Google Sheets API.
Для этого введите в строку поиска "google drive" или "Google Drive API" и кликните на сервисе Google Drive API.
Нажмите Enable. Тоже самое повторить с Google Sheets.


Сайт уведомит вас, что API включено и предупредит, что нужно создать учетные данные. Игнорируйте это предупреждение (ведь мы уже создали сервисный аккаунт).


Убедитесь, что наши API подключены. Они должны включиться автоматически, при подключении API. Если подключение не работает, то вы увидете кнопку Enable. Включите его, при необходимости.

В последний раз зайдите на страницу [Google Developers Console](https://console.cloud.google.com/cloud-resource-manager "https://console.cloud.google.com/cloud-resource-manager"). Выберите на своем проекте меню Settings. В открывшемся окне выберите Service account, и скопируйте к себе на компьютер email сервисного аккаунта. Он пригодится, чтобы выдавать доступ к таблицам.


<br>

##### ▶ Шаг 2: Установите библиотеку google-api-php-client

Первым шагом установим google-api-php с помощью Composer. Откройте свой терминал и перейдите в каталог вашего проекта Laravel. Запустите следующую команду, чтобы установить библиотеку:

`composer require google/apiclient:^2.0`

<br>

##### ▶ Шаг 3: Код

После получения ключа API необходимо добавить его в файл конфигурации проекта Laravel. Для этого нужно открыть файл .env и добавить строки:

```php
GOOGLE_APP_ID=your api id
GOOGLE_CLIENT_ID=your client id
GOOGLE_CLIENT_SECRET=your client secret
GOOGLE_REDIRECT=http://localhost/login/google/callback
GOOGLE_SCOPES="https://www.googleapis.com/auth/docs.readonly"
GOOGLE_APPROVAL_PROMPT="force"
GOOGLE_ACCESS_TYPE="offline"
GOOGLE_CLIENT_EMAIL=your client email
GOOGLE_AUTH_URI=your auth uri
GOOGLE_TOKEN_URI=your token uri
```
В папке config Laravel приложения добавьте google.php следующий код;

```php
<?php

return [
    'project_id' => env('GOOGLE_APP_ID'),
    'private_key_id' => env('GOOGLE_CLIENT_SECRET'),
    'private_key' => env('GOOGLE_PRIVATE_KEY'),
    'client_email' => env('GOOGLE_CLIENT_EMAIL'),
    'client_id' => env('GOOGLE_CLIENT_ID'),
    'auth_uri' => env('GOOGLE_AUTH_URI'),
    'token_uri' => env('GOOGLE_TOKEN_URI'),
];
```


Создайте сервис таким образом: app>Services>GoogleService.php, а затем добавьте следующий код;

```php
<?php

namespace App\Services;

use Google_Service_Sheets_BatchUpdateSpreadsheetRequest;
use Google_Service_Sheets_Request;

class GoogleService
{
    protected $client;

    public function __construct()
    {
        $this->client = $this->init();
    }

    public function init(): \Google_Client
    {
        $client = new \Google_Client();

        // Области, к которым будет доступ
        $client->setScopes([
            \Google_Service_Sheets::SPREADSHEETS,
            \Google_Service_Docs::DOCUMENTS
        ]);

        $client->setAuthConfig(config('google'));

        return $client;
    }

    public function getClient(): \Google_Client
    {
        return $this->client;
    }
    
    public function sheet(): \Google_Service_Sheets
    {
        return new \Google_Service_Sheets($this->client);
    }

    public function appendSheetRow(string $sheetId, $values, string $range = 'Лист 1')
    {
        $service = $this->sheet();
        
        $body = new \Google_Service_Sheets_ValueRange([
            'values' => $values,
        ]);

        $params  = [
            'valueInputOption' => 'RAW',
        ];

        $service->spreadsheets_values->append(
            $sheetId,
            $range,
            $body,
            $params,
        );
    }
}

```
Готовим наши данные, например, в контроллере и вызываем сервис.

```php

// Готовим данные для отображения в таблице
$values = [....];
 
// $sheetId это ID таблицы 
// Получить $sheetId можно из
// google_spreadsheet_url: https://docs.gogle.com/spreadsheets/d/SPREADSHEET_ID
$sheetId = '9KdTaW01c7PURTW4D7QMGgkEexd_UTYi)pUiUIbsmNlY';

// Вызываем сервис
$service = new GoogleService();

// Добавить данные
$service->appendSheetRow($sheetId, $values);

```

