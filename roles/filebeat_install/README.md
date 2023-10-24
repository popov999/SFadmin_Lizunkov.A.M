Эта роль устанавливает filebeat из пакетов deb или rpm.

Включает модуль system для первоначальной записи логов в Elasticsearch.

Плейбук заточен конкретно для использования https, api_key,fingerprint 
при подключении к Elasticsearch 8.

Он пока не является универасльным!!!

При использовании переменных для указания путей к файлам необходимо 
внимательно прописывать "/". Иногда могут возникать ошибки.

Все выполняемые действия и необходимые переменные для использования я постарался описать в файлах которые расположены в папке этой роли.

Пример плейбука:

	---
	- hosts: all
	  become: yes

	  roles:
	    - role: filebeat_install

	      ##### UBUNTU #####

	      # Source directory for deb package on ansible server: "/path1/path2"
	      src_deb: "/home/{{user_node1}}/downloads/elk8.7.0/deb"

	      # Destination directory for deb package on remote server: "name"
	      dest_deb: "downloads"

	      # Name of deb package for elasticsearch: "name.deb"
	      filebeat_deb: "filebeat-8.7.0-amd64.deb"

	      ##### CentOS #####

	      # Source directory for rpm package on ansible server: "/path1/path2"
	      src_rpm: "/home/{{user_node1}}/downloads/elk8.7.0/rpm"

	      # Destination directory for rpm package on remote server: "name"
	      dest_rpm: "downloads"

	      # Name of rpm package for elasticsearch: "name.rpm"
	      filebeat_rpm: "filebeat-8.7.0-x86_64.rpm"

	      ##### Server #####

	      # IP adress(url)  and port Elasticsearch server: "ip_addres:port"
	      elk_server: "{{elk_server1}}"

	      # api_key: "id:api_key"
	      api_key: "{{api_key1}}"

	      # ssl.ca_trusted_fingerprint: "fingerprint" 
	      fingerprint: "{{fingerprint1}}"

