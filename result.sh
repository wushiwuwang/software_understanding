#!/usr/bin/expect -f
set timeout 30

set usr "fcd"
set ip "192.168.43.88"
set psw "123456"
set cmd "/home/fcd/桌面/SWAMP1/run.sh"
spawn ssh $usr@$ip
expect "*password:*"
send "123456\r"
expect "*]"
send "cd /home/fcd/桌面/SWAMP1\r"
expect "*]"
send "bash result.sh\r"
expect "*#"
