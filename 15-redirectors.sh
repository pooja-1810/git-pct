#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"

SCRIPT_NAME=$(echo $0 | cut -d "." -f1)

TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"

mkdir -p $LOGS_FOLDER     # -p (if directory exits nothing happens, if no it creates)
R="\e[31m"
G="\e[32m"
N="\e[0m"
USERID=$(id -u)

CHECK_ROOT()
{
    if [ $USERID -ne 0 ]
    then 
        echo "Please run the script with root privileges"
        exit 1
    fi
}

VALIDATE() {
if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R not successful $N"
        exit 1
    else g
        echo -e "$2  is $G success $N"
    fi
}