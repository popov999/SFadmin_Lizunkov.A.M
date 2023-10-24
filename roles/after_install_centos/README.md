Только для CentOS!!! Установка с личного компа!!!

Перед использованием ansible, на вм с CentOS отключить selinux и перезапустить эту вм!!!

Эта роль выполняет установку и тюнинг минимального набора пакетов, которые
 мне необходимы для комфортной работы в системе.

Создает директории download и script.
Подключает Epel репо.
Устанавливает следующие пакеты:
      - mc
      - net-tools
      - git
      - nmap
      - rsync
      - fail2ban
      - bash-completion
      - vim-enhanced
      - curl
      - wget

Настраивает терминал пользователя для вывода цветного изображения.

Пример плейбука:

	- hosts: servers
	  become: yes

	  roles:
	    - role: after_install_centos
	      when: ansible_distribution == "CentOS"
