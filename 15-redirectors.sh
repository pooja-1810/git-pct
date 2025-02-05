#!/bin/bash

LOGS_FOLDER="/var/log/shell-script"

SCRIPT_NAME=$(echo $0 | cut -d "." -f1)

TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"

mkdir -p $LOGS_FOLDER     # -p (if directory exits nothing happens, if no it creates)
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

USERID=$(id -u)

CHECK_ROOT()
{
    if [ $USERID -ne 0 ]
    then 
        echo -e  "$R Please run the script with root privileges $N" | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE() {
if [ $1 -ne 0 ]
    then
        echo -e "$2 is $R not successful $N" | tee -a $LOG_FILE
        exit 1
    else g
        echo -e "$2  is $G success $N" | tee -a $LOG_FILE 
    fi
}

USAGE()
{
    echo -e "$R USAGE:: $N sudo sh 15-redirectors.sh package1 package2"
    exit 1
}

echo "script started executing at: $(date)"  | tee -a $LOG_FILE

CHECK_ROOT


if [ $# -eq 0 ] # if no. of arguments are 0 
then
    USAGE
fi  

for package in $@ # $@ refers to all arguments passed to it
do
    dnf list installed $package &>>$LOG_FILE
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it" | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "Installing $package"
    else
        echo -e "$package is already $Y installed $N," | tee -a $LOG_FILE
    fi
done