

deletef=$(find /home/ec2-user/logs -name "*.log" -mtime +14)
echo "files to be deleted are $deletef"
while read -r f 
do
    echo -e "\e[31m deleting $f\e[0m "
    rm -rf $f
    if [ $? -ne 0 ]
    then
        echo -e "$f \e[31m deletion failure \e[0m "
    else
        echo -e "\e[32m file deleted : \e[0m  $f"
    fi

done <<< $deletef
