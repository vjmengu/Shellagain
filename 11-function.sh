#!/bin/bash

USERID=$(id -u)

R= \e[31m
G= \e[32m
Y= \e[33m
N= \e[0m

validation(){
    if [ $1 -ne 0 ]
    then
        dnf install $2 -y
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
if [ $USERID -ne 0 ]
then
    echo -e " $R You need root access to perform this task $N "
    exit 1

else
    dnf list installed mysql -y
    validation $? "mysql"
    dnf list installed git -y
    validation $? "git"
fi

    

    