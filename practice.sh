

deletef=$(find /home/ec2-user/logs -name "*.log" -mtime +14)
echo "files to be deleted are $deletef"
while read -r f 
{
do
    echo " deleting $f "
    rm -rf $f
    if [ $? -ne 0 ]
    then
        echo "$f deletion failure"
    else
        echo "file deleted : $f"
    fi

done <<< $deletef
    
}