Эта роль устанавливает пакеты и модули php для CentOS.

Подключает репо epel и remi.
Устанавлевает набор пакетов перечисленных в переменной "packages" из
соответствующей ветки указанной в переменной "version".
Устанавливает при необходимости Apache.
Запускает службы php-fpm и httpd.

Пример плейбука:

	- hosts:
	    - node2
	  become: yes
	  roles: 
	    - role: php_install
	      version: "82"
	      apache: "yes"
	      when: inventory_hostname == "node2"
