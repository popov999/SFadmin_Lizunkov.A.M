### Только для Ubuntu!!! Установка с локального компьютера!!!

### Роль выполняет следующие действия:

1. Устанавливает следующие пакеты:
    - mc
    - nmap
    - git
    - net-tools
    - curl
    - wget
    - tree
    - htop
    - vim
    - tmux
    - ufw
2. Создает директории download и scripts.
3. Копирует файл .bashrc в папу пользователя и разрешает его загрузку при входе.

### Пример плейбука:

	- hosts: servers
	  become: yes

	  roles:
	    - role: after_install_ubuntu
	      when: ansible_distribution == "Ubuntu"

### Отключить обновление и установку пакетов:

        - role: after_install_ubuntu
          INSTALL_PACKAGES: "false"
          when: ansible_distribution == "Ubuntu"

