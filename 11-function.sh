#!/bin/bash

USERID=$(id -u)

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
    else
        echo " $2 already installed"
    
    fi
}
if [ $USERID -ne 0 ]
then
    echo "You need root access to perform this task"
    exit 1

else
    dnf list installed mysql -y
    validation $? "mysql"
    dnf list installed git -y
    validation $? "git"
fi

    

    