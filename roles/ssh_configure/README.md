### Только для Ubuntu!!! Установка с локального компьютера!!!

### Роль выполняет следующие действия:

1. Очищает папку /etc/ssh/sshd_config.d и создает в ней новый файл конфигурации
   со следующими параметрами:
```SSHD_CONFIG
Port <PORT_SSH>
PermitRootLogin prohibit-password
PubkeyAuthentication yes
PermitEmptyPasswords no
```
2. Устанавливает порт по умолчанию 22, если не указан другой в переменной PORT_SSH
3. Перезапускает службу ssh

Пример плейбука: 

	- hosts: servers
	  become: yes
	  roles:
	    - role: ssh_configure
          PORT_SSH: 22

### Для применения настроек в Ubuntu 24.04 cloud-init сервис перезагружается в два этапа!!!

1. `# systemctl daemon-reload`
2. `# systemctl resrart ssh.service`

Или полная перезагрузка сервера вручную.
