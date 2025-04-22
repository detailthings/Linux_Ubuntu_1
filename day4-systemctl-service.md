1. Aim
    -Control service by 'systemctl' and 'service'
    -Automatic start service
    -Write simple script to test and restart service
    -Log and analyst service bug

2. Code
    1. Control with systemctl
        systemctl status ...
        #Check status of service ...
        systemctl + start/stop/enable/disable/restart/reload-or-restart/is-active/is-enable/... + service
        #common commands with systemctl
    2. Write script auto testing service
        wirte file script check_service.sh
        #if apache is running --> running
        #if apache is not running --> Not running
    3. Auto running scrip when start
        add on the crontab the line:
        @reboot /home/user_name/check_service.sh
        #@reboot : running cmmand
        when system start
