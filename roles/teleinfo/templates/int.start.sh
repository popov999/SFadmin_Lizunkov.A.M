#!/bin/bash

HOST_NAME=`hostname`
IP_ADDR=$(ip -br a | grep -e enp -e eth | awk {'print $3'} | cut -d '/' -f1)

tele_token="{{tele_bot}}"
tele_id="{{tele_id}}"

curl -i -X GET "https://api.telegram.org/bot$tele_token/sendMessage?chat_id=$tele_id&text=$HOST_NAME%20Запуск%20Сервера!%20IP:%20$IP_ADDR"
