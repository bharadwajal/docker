#!/bin/bash


docker exec  -t apache netstat -apn | grep 80 | grep LISTEN | wc -l | tr -d '\n' > /Users/blanke/result

r=`cat /Users/blanke/result`
if [ $r == "1" ]
then  
 {
        echo "running"
  }
else
   {
     echo "not running"
   }   
fi
