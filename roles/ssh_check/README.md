Example Playbook
----------------
- hosts: servers
  become: yes

  roles:
    - role: ssh_check
