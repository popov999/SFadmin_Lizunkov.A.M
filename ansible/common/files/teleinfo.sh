#!/bin/bash

# Add your dates
my_bot=""
my_id=""

HOST_NAME=`hostname`
IP_INT="{{ ansible_ssh_host }}"

curl -i -X GET "https://api.telegram.org/bot$my_bot/sendMessage?chat_id=$my_id&text=$HOST_NAME%20запущен!%20IP:%20$IP_INT"

