#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

timestamp=$(date +%Y-%m-%d-%H-%M-%S)
file_name=$(echo $0 | cut -d "." -f1)
file_location="/var/log/ShellLogs"
file_name_logs="$file_location/$file_name-$timestamp.log"

validation(){
    if [ $1 -ne 0 ]
    then
        dnf install $2 -y &>>$file_name_logs
        if [ $? -ne 0 ]
        then
            echo -e "installing $2... $R failed! $N"
        else
            echo -e " installing $2... $G Sucess $N!"
        
        fi
    else
        echo -e " $2 already $Y installed $N"
    
    fi
}
echo "program excution started at $timestamp" &>>$file_name_logs
if [ $USERID -ne 0 ]
then
    echo -e " $R You need root access to perform this task $N "
    exit 1

else
    dnf list installed mysql -y &>>$file_name_logs
    validation $? "mysql"
    dnf list installed git -y &>>$file_name_logs
    validation $? "git"
fi

    

    