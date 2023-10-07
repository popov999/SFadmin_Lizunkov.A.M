Ansible. Open VPN Client.

На сервере предварительно уже должны лежать папки с файлами для клиентов vpn в ~/easy-rsa.

Имена папок с ключами и сертефикатами для клиентов должны иметь имена inventory_hostname не включая "." и символы идущие после нее.
Например:
inventory_hostname=example.com
dir_name=example

Установка пакетов:
# apt update
# apt install openvpn

- name: Получение первой части имени хоста
  set_fact:
    vpn_client: "{{ inventory_hostname.split('.')[0] }}"

Копирование файлов ключей и сертификатов в /etc/openvpn/client
Копирование файла настроек в /etc/openvpn/client.conf

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

Удалить папки с ключами и сертификатами клиентов на сервере.

Запуск службы openvpn@client.service
 на клиентах 

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - { role: username.rolename, x: 42 }

