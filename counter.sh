#!/bin/bash

echo "Processing file: $1"

#count 4xx and 5xx
count=$(grep -Eo 'HTTP/1.1" (4[0-9]{2}|5[0-9]{2})' $1 | wc -l)
echo "Number of response statuses with HTTP 4xx or 5xx: $count"
