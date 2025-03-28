#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
mkdir -p /home/ec2-user/log
path=/home/ec2-user/log
filelog=$(echo $0 | cut -d "." -f1)
timestamp=$(date +%Y-%m-%d-%H-%M-%S )
logs=$path/$filelog-$timestamp.log
validate(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R $2 .... Failed $N "
    else
        echo -e "$G $2 ..... Success $N"
    fi
}
userid=$(id -u)
if [ $userid -ne 0 ]
then
    echo -e "$R Please use root access $N"
    exit 1
else
    dnf install nginx -y &>$logs
    validate $? "nginx installation"
    systemctl enable nginx &>$logs
    validate $? "nginx enable"
    systemctl start nginx &>$logs
    validate $? "nginx start"
    rm -rf /usr/share/nginx/html/* &>$logs
    curl -o /tmp/frontend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-frontend-v2.zip
    cd /usr/share/nginx/html/
    unzip /tmp/frontend.zip &>$logs
    cp /home/ec2-user/Shellagain/expense-shell/expense.conf /etc/nginx/default.d/expense.conf
    systemctl restart nginx &>$logs
fi