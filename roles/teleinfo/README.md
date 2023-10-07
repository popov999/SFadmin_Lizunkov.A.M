Example Playbook
----------------
- hosts: servers
  become: yes

  roles:
    - role: teleinfo
      tele_bot: "<tocken>"
      tele_id: "<id>"
      ip_type: "int"
      # ip_type: "pub"
