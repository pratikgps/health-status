#!/bin/bash

LOG_FILE="/var/log/sys_health.log"
EMAIL="pratik.gitlab@gmail.com"

check_disk_usage() {
 REPORT="/tmp/disk_usage_report.txt"
    echo "Checking disk usage..."
    {
        echo "=== Disk Usage Report ==="
        echo "Date: $(date)"
        echo
        df -h
} > "$REPORT"
        df -h
   mail -s "Disk Usage Report" "$EMAIL" < "$REPORT"
    echo "Disk usage report sent successfully!"
}



monitor_services() {
 REPORT="/tmp/services_report.txt"
    echo "Monitoring running services..."
    {
        echo "=== Running Services Report ==="
        echo "Date: $(date)"
        echo
        systemctl list-units --type=service --state=running
    } > "$REPORT"
     systemctl list-units --type=service --state=running
    mail -s "Running Services Report" "$EMAIL" < "$REPORT"
    echo "Services report sent successfully!"
}
check_memory_usage() {

REPORT="/tmp/memory_usage_report.txt"
    echo "Checking memory usage..."
    {
        echo "=== Memory Usage Report ==="
        echo "Date: $(date)"
        echo
        free -m
    } > "$REPORT"
    free -m 
    mail -s "Memory Usage Report" "$EMAIL" < "$REPORT"
    echo "Memory usage report sent successfully!"
}


check_cpu_usage() {
 REPORT="/tmp/cpu_usage_report.txt"
    echo "Checking CPU usage..."
    {
        echo "=== CPU Usage Report ==="
        echo "Date: $(date)"
        echo
        top -bn1 | grep "Cpu"
    } > "$REPORT"
    top -bn1 | grep "Cpu"
    mail -s "CPU Usage Report" "$EMAIL" < "$REPORT"
    echo "CPU usage report sent successfully!"
}
send_report() {
    REPORT="/tmp/sys_health_report.txt"
    echo "Generating system health report..."

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

    mail -s "System Health Report" "$EMAIL" < "$REPORT"
    echo "Report sent successfully!"
}

while true; do
    echo "============================="
    echo " System Health Check Menu"
    echo "============================="
    echo "1. Check Disk Usage"
    echo "2. Monitor Running Services"
    echo "3. Assess Memory Usage"
    echo "4. Evaluate CPU Usage"
    echo "5. Send Comprehensive Report"
    echo "6. Exit"
    read -p "Enter your choice: " choice
    
    case $choice in
        1) check_disk_usage ;;
        2) monitor_services ;;
        3) check_memory_usage ;;
        4) check_cpu_usage ;;
        5) send_report ;;
        6) echo "Exiting..."; exit 0 ;;
        *) echo "Invalid option. Please try again." ;;
    esac
    echo "Press Enter to continue..."
    read
done
