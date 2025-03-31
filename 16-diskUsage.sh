# check the disk useage % of hardisk
# store the required files in a variable
# print the disk location and %
# run every 1 min for testing

Disk_Usage=$(df -hT | grep xfs)
Threshold=5

while read -r line
do
    echo $line

done <<< $Disk_Usage