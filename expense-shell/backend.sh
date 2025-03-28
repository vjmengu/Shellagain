#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

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
    dnf module disable nodejs -y
    dnf module enable nodjs:20 -y
    dnf install nodjs -y
    systemctl enable nodejs
    systemctl start nodejs
    id expense
    if [$? -ne 0 ]
    then
        useradd expense
    else
        echo "expense useer already available"
    fi

    mkdir -p /app
    cd /app
    curl -o /tmp/backend.zip https://expense-builds.s3.us-east-1.amazonaws.com/expense-backend-v2.zip
    unzip /tmp/backend.zip
    npm install
    cp /home/ec2-user/Shellagain/expense-shell/backend.service /etc/systemd/system/backend.service
    systemctl daemon-reload
    systemctl start backend
    systemctl enable backend
    dnf install mysql -y
    mysql -h mysql.vijayjohn.online -u root -pExpenseApp@1 < /app/schema/backend.sql
    systemctl restart backend
fi
    