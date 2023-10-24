Эта роль устанавливает zabbix-agent для Ubuntu и CentOS.

Подключает репо для Zabbix v6.0 LTS.
Устанавливает пакет zabbix-agent.
Выполняет конфигурацию агента с указанием "Server=" и "Hostname=".

Hostname берется из переменной ansible_hostname и такое же имя должен
использовать Zabbix Server!!!

Копирует небольшой скрипт (UserParameter) для проверки соединения с Zabbix Server.

На сервере можно выполнить в терминале:
'zabbix_get -s 10.11.12.2 -k test'

Пример плейбука:

	- hosts: all
	  become: yes

	  roles:
	    - role: zabbix-agent_install
	      zabbix_server: "{{zbx_server}}"
	      repo_inst: "true"

	    - role: open_port
	      save_rules: "true"
	      open_port: "10050"

