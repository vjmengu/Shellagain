#user should give source & destination
#check if source & dest actually exists
#check if any files available on source
#check if any  log files older than 14 days in source
#zip
#check if ziped
#delete source old log files

R="\e[31m"
Y="\e[32m"
G="\e[33m"
N="\e[0m"
timestamp=$(date +%Y-%m-%d-%H-%M-%S)
source_dir=$1
destin_dir=$2
days=${3:-14}
usage()
{
    echo -e "\e[31m usage:: 15-backup.sh <source files path> <destination file path> \e[0m"
}
if [ $# -lt 2 ]
then
    usage
    exit
fi

if [ ! -d $source_dir ]
then
    echo -e " $R $source_dir does not exist $N"
    exit 1
fi

if [ ! -d $destin_dir ]
then
    echo -e " $R $destin_dir does not exist $N"
    exit 1
fi

files=$(find $source_dir -name "*.log" -mtime +$days)

zip_file="$destin_dir/app-log-$timestamp.zip"

if [ -n "$files" ]
then
    echo -e "$G files older than $days are:: $files $N"
    find $source_dir -name "*.log" -mtime +$days | zip -@ $zip_file
    if [ -f $zip_file ]
    then
       while -r read file
       do
           echo -e "$R deleting $file"
           rm -rf $file
       done <<< $files
    else
       echo -e "$R Zip file not created $N"
    fi

else
    echo -e "$Y there are no files older than $days days $N"
fi






