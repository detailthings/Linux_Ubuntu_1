# Day 2: Install Web Server (apache), FTP, Create User SSH

## 1. Goal
    - Install Apache2
    - Install FTP server (vsftpd)
    - Create user 'sysadmin' to own SSH
    - Test above feature

## 2. coding
    a. Install Apache
        - sudo apt install apache2 -y
         #Install apache2 through apt
        - sudo systemctl status apache2
         #Test the status of apache2
         #If it is "(active running)", install succes.
        - http://(ip-virtual-machine)
         #Test on the browser in real machine
         #If it appear "Apache2 Ubuntu Default Page", it is succes.
    b. Instal FTP server (vsftpd)
        - sudo apt install vsftpd -y
         #Install vsftpd through apt
        - sduo systemctl status vsftpd
         #Test the status of vsftpd
         #If it is "(active running)", install succes.
        - sudo cp /etc/vsftpd.conf /etc/vsftp.conf.bak
         #copy file config (configuration files) of vsftpd on /etc folder to backup file  
         (this is the commom step before config file to prevent the data)
        - sudo nano /etc/vsftpd.conf.bak
         #config file backup has been created and sure that this include: 
            anonymous_enable=NO
            local_enable=YES
            write_enable=YES
            chroot_local_user=YES
        - sudo systemctl restart vsftpd
         #restart ftp server if have the change in the befor config.
    c. Create user FTP
        - sudo adduser ftpuser
         #Create new user with name 'ftpuser'
         #Then, add password or information if you want.
    d. Create SSH user to management 
        - sudo adduser sysadmin
         #Create new user with name 'sysadmin'
         #Then, add password or information if you want.
        - sudo usermod -aG sudo sysadmin
         #Sign the user sysadmin to group sudo
        - ssh sysadmin@(ip_virtual_machine)
         #Test, if sign in sucess, it is done.
