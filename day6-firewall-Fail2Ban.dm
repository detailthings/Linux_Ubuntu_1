I. Aim
-Setup the firewall
-Setup and config Fail2Ban to protect from brute-force SSH
-Auto protect when start server

II. Code
1. Setup Firewall
	- sudo apt update
	- sudo apt install ufw -y
	 download UFW - Uncomplicated Firewall
	- sudo ufw allow 22(/80/443/)tcp
	 open the needed gate: SSH, HTTP, HTTPS
	- sudo ufw enable
	 start ufw, The first task if you use SSH
	- sudo ufw status verbose
	 check status
2. Setup and config Fail2Ban
	- sudo apt update
	- sudo apt install fail2ban -y
	 download fail2ban - help to block IP if log ssh wrong too much times
	- sudo cp /etc/fail2ban/jail.cof /etc/fail2ban/jail.local
	- sudo nano /etc/fail2ban/jail.local
	- find sshd and fix:
		[sshd]
		enabled = true
		port    = ssh
		logpath = %(sshd_log)s
		backend = systemd
		maxretry = 5
		bantime = 600
		findtime = 600
	- sudo systemctl restart fail2ban
	- sudo systemctl enable fail2ban
	 Start fail2ban with new config
	- sudo fail2ban-client status
	 check status (all)
	- sudo fail2ban-client status sshd
	 check own ssh
3. Auto start security when start
	- sudo systemctl enable ufw
	- sudo systemctl enable 

