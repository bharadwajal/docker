#!/bin/bash


docker exec  -t apache netstat -apn | grep 80 | grep LISTEN | wc -l | tr -d '\n' > /var/lib/jenkins/users/bj/wait_results

r=`cat /var/lib/jenkins/users/bj/wait_results`
if [ $r == "1" ]
then  
 {
        echo "apache2 is running on PORT 80"
  }
else
   {
     echo "apache is not running"
   }   
fi
