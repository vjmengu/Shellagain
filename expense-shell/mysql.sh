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

    dnf install mysql-server -y
    validate $? "mysql-server"
    systemctl enable mysqld
    validate $? "enable mysql-server"
    systemctl start mysqld
    validate $? "starting mysql-server"
    mysql -h mysql.vijayjohn.online -u root -pExpenseApp@1 -e 'show databases;'
    if [ $? -ne 0 ]
    then
        mysql_secure_installation --set-root-pass ExpenseApp@1
        validate $? " password setup "
    else
        echo -e " $G Password Already Set, skipping setup $N " 
    fi
fi

