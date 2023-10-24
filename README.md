# SFadmin_Lizunkov.A.M

Источники, которые мне помогали в написании ролей:
- https://www.dmosk.ru/miniinstruktions.php?mini=ansible-examples
- https://docs.ansible.com/
- https://t.me/GPT4Telegrambot 

Все роли написаны с нуля. И они пока не универсальные. Иногда могут выдавать ошибки, если переменные прописаны не корректно.

В папке каждой роли и плейбуках в корневой папке я постарался описать действия и используемые переменные на английском языке, используя переводчик от яндекса.

В корневой папке я их пронумеровал в той последовательности в которой прокатывал.
Есть пропущенные номера, т.к некоторые сервисы устанавливал вручную или переустанавливал и переконфигурировал уже установленные.


hosts:
  node1 - ansible
  node2 - web server
  node3 - ELK

Сервисы установленные с использованием ansible:

- openvpn-client (node2,node3)
- nginx (all)
- apache (node2)
- php,php-fpm + modules (node2)
- ELK (node3. В последствии запустил из докера) 
- filebeat (all)
- PostgreSQL-12 (node3)
- docker (node1, node3)
- zabbix-agent (all)

Сервисы и дополнительные пакеты, которые я устанавливал и настраивал вручную:

node1:
  - ansible
  - openvpn-server
  - Zabbix (docker)
  - Grafana (docker)

node2:
  - named(bind)
  - mysql(mariadb)
  - postfix
  - dovecot
  - roundcube
  - wordpress

node3:
  - Elastiksearch, Kibana (docker)
  - pgadmin4 + demo_base

