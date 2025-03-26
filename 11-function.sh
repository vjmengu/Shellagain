#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "You need root access to perform this task"
    exit 1

validation(){
    if [ $1 -ne 0 ]
    then
        dnf install $2 -y
        if [ $? -ne 0 ]
        then
            echo "installing $2... failed!"
        else
            echo " installing $2... Sucess!"
        
        fi
}
else
    dnf list installed mysql -y
    validation $? "mysql"
    else
        echo " mysql already installed"
    
    fi

    dnf list installed git -y
    validation $? "git"
    else
        echo " git already installed"
    
    fi

    