#!/bin/bash

HOST_NAME=`hostname`
IP_ADDR=$(ip -br a | grep -e enp -e eth | awk {'print $3'} | cut -d '/' -f1)

curl -i -X GET "https://api.telegram.org/bot{{tele_bot}}/sendMessage?chat_id={{tele_id}}&text=$HOST_NAME%20запущен!%20IP:%20$IP_ADDR"

