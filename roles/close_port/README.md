Эта роль закрывает порты в CentOS используя firewalld.

Пример плейбука:

- hosts:
    - virtual2.lu

  become: yes

  roles:
    - role: close_port
      vars:
        save_rules: "yes"
        proto_port: "tcp"
        close_port:
          - "80"
          - "443"
          - "8080"
          - "8090"
          - "10050"
