Перед использованием ansible, на вм с CentOS отключить selinux и перезапустить эту вм!!!


Example Playbook
----------------
- hosts: servers
  become: yes

  roles:
    - role: after_install_centos
      when: ansible_distribution == "CentOS"
