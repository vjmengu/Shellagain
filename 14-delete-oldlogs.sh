source_file="/home/ec2-user/logs"

filestodelete=$(find ${source_file} -name "*.log" -mtime +14)

echo "files to delete are: $filestodelete"

while read -r files
do

    echo "deleting $files"

    rm -rf $files

done <<< $filestodelete