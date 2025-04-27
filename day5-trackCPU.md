I.Aim
  -Follow the CPU, RAM, Disk
  -Create script ìf over resource
  -Announment on terminal
II.Code
	I. Follow CUP, RAM, Disk
		- a. Manual
			- ip a: Check the ip network
			- DISK: df -h: check the disk
			- RAM: free -h: check the RAM
			- CPU: top: check the CPU
	II. Write tracker script
	#!/bin/bash

# Ngưỡng cảnh báo
CPU_THRESHOLD=80
RAM_THRESHOLD=80
DISK_THRESHOLD=80

# Lấy thông tin hệ thống
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}')
ram_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')
disk_usage=$(df / | grep / | awk '{print $5}' | sed 's/%//g')

# Kiểm tra CPU
if (( $(echo "$cpu_usage > $CPU_THRESHOLD" | bc -l) )); then
    echo "⚠️ CPU usage is high: $cpu_usage%"
fi

# Kiểm tra RAM
if (( $(echo "$ram_usage > $RAM_THRESHOLD" | bc -l) )); then
    echo "⚠️ RAM usage is high: $ram_usage%"
fi

# Kiểm tra DISK
if (( $disk_usage > $DISK_THRESHOLD )); then
    echo "⚠️ Disk usage is high: $disk_usage%"
fi
	III.Auto warn each 5 munite
	- Add to crontab: crontab -e
	- */5**** /home/hiu/monitor.sh: each 5 munite
