# check the disk useage % of hardisk
# store the required files in a variable
# print the disk location and %
# run every 1 min for testing

Disk_Usage=$(df -hT | grep xfs)
Threshold=5

while read -r line
do
    memory=$(Disk_Usage|cut -d " " -f6)
    location=$(Disk_Usage|cut -d " " -f7)
    echo " location is :: $location , Memory is :: $memory"
    
done <<< $Disk_Usage