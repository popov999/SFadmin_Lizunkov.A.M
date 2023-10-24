Эта роль устанавливает Open VPN Client в CentOS и Ubuntu.

Создает папку для ведения журналов /var/log/openvpn.
Копирование файлов ключей и сертификатов в /etc/openvpn/client
Копирование файла настроек в /etc/openvpn/client.conf
Запускает службу openvpn@client.service.

На сервере предварительно уже должны лежать папки с файлами для клиентов vpn в ~/easy-rsa/clients.

Имена файлов с ключами и сертефикатами для клиентов должны иметь имена inventory_hostname не включая "." и символы идущие после нее.
Например:
	inventory_hostname=example.com
	dir_name=example

Просто в моем случае inventory_hostname перечисленные в файле hosts для ansible
имеют в конце ".lu" (Имели. В последствии я от них отказался)

По пути указанным в переменной cert_pat должны лежать следующие файлы:
	- ca.crt — сертификат удостоверяющего центра CA 
	- ta.key — статический ключ HMAC для дополнительной защиты
	- example1.crt — для inventory_hostname = example1
	- example1.key — для inventory_hostname = example1
	- example2.crt — для inventory_hostname = example2
	- example2.key — для inventory_hostname = example1



Конфиг файл /etc/openvpn/client.conf:

	client
	dev tun
	proto tcp
	remote {{server_ip}} {{server_port}}
	resolv-retry infinite
	nobind
	persist-key
	persist-tun
	cd /etc/openvpn/client
	ca ca.crt
	cert {{vpn_client}}.crt
	key {{vpn_client}}.key
	tls-auth ta.key 1
	cipher AES-256-GCM

	auth-nocache
	remote-cert-tls server
	verb 3
	status /var/log/openvpn/openvpn-status.log 1
	status-version 3
	log-append /var/log/openvpn/openvpn-client.log

Желательно удалить папки с ключами и сертификатами клиентов на сервере.

Пример плейбука:

	---
	- hosts:
	    - node2.lu
	    - node3.lu
	  become: yes

	  roles:
	    - role: openvpn_client
	      cert_path: "/home/user/easy-rsa/clients/"
	      server_ip: "{{vpn_server_ip}}"

