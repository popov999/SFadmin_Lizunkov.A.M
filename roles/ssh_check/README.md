Эта роль выводит в терминал конкретные значения настроек sshd для проверки.
- passwordauth
- permitroot

Пример плейбука: 

- hosts: ya_cloud
  become: yes
  roles:
    - role: ssh_check

