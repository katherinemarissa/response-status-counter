#!/bin/bash

echo "Processing file: $1"

#count 4xx and 5xx
count=$(grep -Eo 'HTTP/1.1" (4[0-9]{2}|5[0-9]{2})' $1 | wc -l)
echo "Number of response statuses with HTTP 4xx or 5xx: $count"

#constructing the email
to="" #email address to send alert to
from="" #email address to send alert from
pw="" #app password of email address to send alert from
subject="High Number of Error Responses in file: $1"
body="Number of error responses detected: $count"

email=$(cat << EOF
To: $to
From: $from
Subject: $subject
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8

$body
EOF
)

touch tmpfile.txt
echo -e "$email" > tmpfile.txt

if [ $count -gt 100 ]; then
	curl -s --url 'smtps://smtp.gmail.com:465' --ssl-reqd \ #gmail smtp port for SSL is 465
    --mail-from "$from" \
    --mail-rcpt "$to"\
    --user "$from":"$pw" \
    -T tmpfile.txt
else
	echo "Count is less than 100. No email sent."
fi