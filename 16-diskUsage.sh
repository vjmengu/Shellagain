# check the disk useage % of hardisk
# store the required files in a variable
# print the disk location and %
# run every 1 min for testing

Disk_Usage=$(df -hT | grep xfs)
Threshold=5
MSG=""

while read -r line
do
    memory=$(echo $line|cut -d " " -f6| cut -d "%" -f1)
    location=$(echo $line|cut -d " " -f7)
    
    if [ $memory -ge $Threshold ]
    then
        MSG+=" location is :: $location , Memory is :: $memory"
    fi
done <<< $Disk_Usage

echo -e "$MSG"