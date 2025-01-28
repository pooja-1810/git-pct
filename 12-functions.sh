#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"

USERID=$(id -u)
#echo "user id is $USERID"

VALIDATE() {
if [ $1 -ne 0 ]
    then
        echo "$2 is $R not successful $N"
        exit 1
    else g
        echo "$2  is $G success $N"
    fi
}

if [ $USERID -ne 0 ]
then
    echo "Please run this script with root privileges"
    exit 1
fi 

#dnf install git -y

dnf list installed git 

if [ $? -ne 0 ]
then
    echo "git is not installed, going to install it"
    dnf install git -y
    VALIDATE $? "Installing Git"
else
    echo "git is already installed,"
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    echo "mysql is not installed, going to install it"
    dnf install mysql -ysssss
    VALIDATE $? "Installing Mysql"
else
    echo "mysql is already installed,"
fi