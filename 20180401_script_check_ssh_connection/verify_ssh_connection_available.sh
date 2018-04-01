#!/bin/bash

user="user_example"
remote_host="example.com"

logFile="/var/log/check_established_connection.log"
email_address="example@mirabellette.eu"

status=$(ssh -o IdentityFile=/etc/ssl/private/private.key -o BatchMode=yes -o ConnectTimeout=10 -o port=22 $user@$remote_host echo ok 2>&1)

if [[ $status == ok ]] ; then

	echo "Established link with with $user@$remote_host successful" | tee -a $logFile

else

	echo "Established link with $user@$remote_host host failed" | tee -a $logFile

	echo -e "Subject:Established link with xxxxx failed\n\n Established link with $user@$remote_host" | sudo -u smmsp sendmail $email_address

fi 

exit(0)
