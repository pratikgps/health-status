#!/bin/bash

LOG_FILE="/var/log/sys_health.log"
EMAIL="Pratik.gitlab@gmail.com"

while true; do
    echo "============================="
    echo "  System Health Check Menu"
    echo "============================="
    echo "1. Check Disk Usage"
    echo "2. Monitor Running Services"
    echo "3. Assess Memory Usage"
    echo "4. Evaluate CPU Usage"
    echo "5. Send Comprehensive Report"
    echo "6. Exit"
    read -p "Enter your choice: " num

if [ "$num" == 1 ]; 
  then
        echo ""
        echo "Checking disk usage..."
        echo ""
        echo "Date: $(date)"
        echo -e "\ndf -h"

elif [ "$num" == 2 ]; 
  then
        echo ""
        echo "Checking monitor services..."
        echo ""

elif [ "$num" == 3 ]; 
  then
        echo ""
        echo "checking memory usage..."
        echo ""

elif [ "$num" == 4 ]; 
  then
       echo ""
       echo "checking cpu usage..."
       echo ""

elif [ "$num" == 5 ]; 
  then
        echo ""
        echo "sending report.."
        echo ""

elif [ "$num" == 6 ];  
  then
        echo ""
        echo "Exiting..."
        echo ""
        exit 0
else
        echo ""
        echo "Please Enter Correct number between 1-6. Thank You!."
        echo ""
fi

echo "Press Enter to continue..."
echo ""
read
done
