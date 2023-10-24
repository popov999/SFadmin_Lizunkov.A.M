Данная роль выполняет следуюущие действия:

	- Установка Apache только на CentOS.	
	- Копирование папки с файлами тестовой веб страницы
	- Копирует конфиг файл для тестового сайта с подстановкой нужного порта
	- Создает ссылку для нашего тестового конфига
	- Перезапускает Apche

## Не забываем открыть нужные порты 80,443 для поучения сертификатов и указанный порт.

Использует следующие переменные:
	- apache_port: 80
	- apache_server_name: "_"
	- apache_state: "restarted" # Запускает службу (started/stopped/restarted)
	- apache_enabled: "true"  # Службу (true/false)


Пример плейбука:

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

