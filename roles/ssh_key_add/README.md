Example Playbook
----------------
- hosts: servers
  become: yes

  roles:
    - role: ssh_key_add
      main_server: '<inventory_hostname>'
      key_name: "int_rsa"

