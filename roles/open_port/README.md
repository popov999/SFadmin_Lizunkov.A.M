Эта роль открывает порты указанные в плейбуке для CentOS и Ubuntu.

Пример плейбука:

- hosts:
    - node1
    - node2
  become: yes
  roles:
    - role: open_port
      save_rules: "true"
      open_port:
        - "8080"
      when: inventory_hostname == "node2"

