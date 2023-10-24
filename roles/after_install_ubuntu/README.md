Только для Ubuntu!!! Установка с личного компа!!!

Эта роль выполняет установку и тюнинг минимального набора пакетов, которые
 мне необходимы для комфортной работы в системе.

Создает директории download и script.

Устанавливает следующие пакеты:
      - mc
      - net-tools
      - git
      - nmap
      - fail2ban
      - curl
      - iptables-persistent

Выставляет минимальный набор правил для iptables:

*filter
:INPUT DROP [0:0]
:FORWARD DROP [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -m icmp --icmp-type 8 -j ACCEPT
-A INPUT -i lo -j ACCEPT
COMMIT

Возможно лучше использовать ufw.


Пример плейбука:

- hosts: servers
  become: yes

  roles:
    - role: after_install_ubuntu
      when: ansible_distribution == "Ubuntu"
