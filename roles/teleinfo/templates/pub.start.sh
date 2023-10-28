#!/bin/bash

HOST_NAME=`hostname`
IP_ADDR=`curl 2ip.ru

tele_token="{{tele_bot}}"
tele_id="{{tele_id}}"

curl -i -X GET "https://api.telegram.org/bot$tele_token/sendMessage?chat_id=$tele_id&text=$HOST_NAME%20запущен!%20IP:%20$IP_ADDR"

