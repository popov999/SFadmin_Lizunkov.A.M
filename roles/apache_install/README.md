Установка Nginx.

## Установка пакетов на Centos

## Копирование папки с файлами тестовой веб страницы
## Выставляем права www-data:www-data

## Копируем конфиг файл для тестового сайта с подстановкой нужного порта

## Удаляем ссылки на default конфиги

## Создаем ссылку для нашего тестового конфига

## Перезапускаем Nginx

## Не забываем открыть нужные порты 80,443 для поучения сертификатов и указанный порт.


Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

- hosts:
    - host1
    - host2
  become: yes

  roles:
    - role: apache_install
      apache_port: 8080
      apache_server_name: "examle.com"
      apache_state: "started"
      apache_enabled: "true"
