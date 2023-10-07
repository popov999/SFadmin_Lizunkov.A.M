Example Playbook
----------------
- hosts: servers
  become: yes

  roles:
    - role: after_install_centos
      when: ansible_distribution == "Ubuntu"
