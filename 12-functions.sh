#!/bin/bash

USERID=$(id -u)
#echo "user id is $USERID"

VALIDATE() {
if [ $1 -ne 0 ]
    then
        echo "$2 is not successful"
        exit 1
    else g
        echo "$2  is success"
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

dnf list installed mysqlss

if [ $? -ne 0 ]
then
    echo "mysql is not installed, going to install it"
    dnf install mysql -y
    VALIDATE $? "Installing Mysql"
else
    echo "mysql is already installed,"
fi