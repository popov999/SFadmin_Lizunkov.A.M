#!/bin/bash

HOST_NAME=`hostname`

curl -i -X GET "https://api.telegram.org/bot{{tele_bot}}/sendMessage?chat_id={{tele_id}}&text=$HOST_NAME%20Выключение%20сервера!"

