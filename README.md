# response-status-counter

This bash script does the following:
1. Counts the number of HTTP 4xx and 5xx response statuses in the apache log file. The filename would be provided as a parameter to the script
2. Sends an email alert on the high number of error responses together with relevant information if number of error responses exceeds a specified threshold
3. A cron job is included to run the bash script every hour
