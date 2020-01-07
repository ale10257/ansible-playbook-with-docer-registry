### Образец использования возможностей ansible для развертывания конфигурации на удаленном сервере согласно заданным условиям

#### Формулировка задачи

Есть три рабочих домена: api.example.com, frontend.example.com, registry.example.com.  

Домены api.example.com и frontend.example.com - это некое web приложение, которое работает в докер контейнерах по протоколу https. 

Домен registry.example.com - приватный докер репозиторий. Он должен работать на 5000 порту, также по протоколу https, без nginx

Сертификаты для всех доменов генерируются с помощью `certbot`, `authenticator = webroot`. Подробности об аутентификаторах для `certbot`: https://certbot.eff.org/docs/using.html#getting-certificates-and-choosing-plugins

**Необходимо настроить vps, под управлением Ubuntu, используя возможности Ansible**

**Важное замечание:** для корректной работы приватного докер репозитория требуются сертификаты `registry.example.com.crt` и `registry.example.com.key`.  
По умолчанию letsencrypt такие файлы не генерирует. Их необходимо создавать самим с помощью bash скрипта `templates/registry.sh.j2`

Во время развертывания окружения, данный скрипт копируется в `/etc/letsencrypt/registry.sh`, и будет автоматически запускаться каждый раз после обновления сертификатов  
За автоматический запуск отвечает `post-hook` в файле настроек  `/etc/letsencrypt/cli.ini`

```
...
post-hook = /etc/letsencrypt/registry.sh
...
```

Для запуска плейбуков необходимо создать файл `hosts.yml` по образцу `hosts.yml.example` с верными переменными

Данный проект создан, благодаря ресурсу https://deworker.pro  
Эпизод: https://deworker.pro/edu/series/interactive-site/ansible-provisioning



