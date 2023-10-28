#!/bin/bash

HOST_NAME=`hostname`

tele_token="{{tele_bot}}"
tele_id="{{tele_id}}"

curl -i -X GET "https://api.telegram.org/bot$tele_token/sendMessage?chat_id=$tele_id&text=$HOST_NAME%20Выключение%20сервера!"
