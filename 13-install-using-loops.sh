userid=$(id -u)
if [ $userid -ne 0 ]
then
    echo -e "$(\e[31m) login as a root user"
else

    for package in $@
    do
        dnf list installed $package
        if [ $? -ne 0 ]
        then
            dnf install $package -y
            if [ $? -ne 0 ]
            then
                echo " $package not installed "
            else
                echo " $package installation successful "
            fi
        else
            echo " $package already installed "
        fi
    done
fi