#user should give source & destination
#check is source & dest actually exists
#check if any files available on source
#check if any  log files older than 14 days in source
#zip
#check if ziped
#delete source old log files
usage()
{
    echo -e "\e[31m usage:: 15-backup.sh <source files path> <destination file path>"
}
if [ $# -ln 2 ]
then
    usage
fi

