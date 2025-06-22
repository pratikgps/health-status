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
        echo -e "\nDisk Usage:"
        df -h

elif [ "$num" == 2 ]; 
  then
        echo ""
        echo "Checking monitor services..."
        echo ""
        echo "Date: $(date)"
        echo -e "\nRunning Services:"
        systemctl list-units --type=service --state=running

elif [ "$num" == 3 ]; 
  then
        echo ""
        echo "checking memory usage..."
        echo ""
        echo "Date: $(date)"
        echo -e "\nMemory Usage:"
        free -m

elif [ "$num" == 4 ]; 
  then
       echo ""
       echo "checking cpu usage..."
       echo ""
       echo "Date: $(date)"
       echo -e "\nCPU Usage:"
       top -bn1 | grep "Cpu"

elif [ "$num" == 5 ]; 
  then
        echo ""
        echo "Showing report.."
        echo ""
    {
        echo "=== System Health Report ==="
        echo "Date: $(date)"
        echo -e "\nDisk Usage:"
        df -h
        echo -e "\nRunning Services:"
        systemctl list-units --type=service --state=running
        echo -e "\nMemory Usage:"
        free -m
        echo -e "\nCPU Usage:"
        top -bn1 | grep "Cpu"
    } > "$REPORT"

    mail -s "System Health Report" "$EMAIL" < "$REPORT"
    echo "Report sent successfully!"

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
