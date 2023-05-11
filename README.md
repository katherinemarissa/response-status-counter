# response-status-counter

This bash script does the following:
1. Counts the number of HTTP 4xx and 5xx response statuses in the apache log file. The filename would be provided as a parameter to the script
2. Sends an email alert on the high number of error responses together with relevant information if number of error responses exceeds a specified threshold
3. A cron job is included to run the bash script every hour


Instructions for running the script:
1. Edit counter.sh to provide the following values
	a. to=""
	b. from=""
	c. pw=""
	Note: For instructions on how to set up app password for gmail, go here: https://support.google.com/mail/answer/185833?hl=en-GB

2. In the command-line interface, create a cron job using `crontab -e` command with the contents of cron.txt
	Note-1: 0 * * * * means the cron job will run every hour of every day (e.g. 12:00, 13:00, 14:00, and so on)
	Note-2: Cron is a Unix-based utility and not available by default on Windows. I used Cygwin (https://www.cygwin.com/install.html) which is a Unix-like environment for Windows.
	Note-3: If you need to view the logs for the cron job, search for `cron.log` in the dir where you created the cron job