Устанавливает скрипт для в Telegram, который присылает сообщение о запуске
соответсвующего хоста и его публичный IP.

Сделано для удобства, что бы не лезть каждый раз в консоль управления.


Пример плейбука:

- hosts: servers
  become: yes

  roles:
    - role: teleinfo
      tele_bot: "<tocken>"
      tele_id: "<id>"
      ip_type: "int"
      # ip_type: "pub"
