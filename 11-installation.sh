#!/bin/bash

USERID=$(id -u)
#echo "user id is $USERID"

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
    if [ $? -ne 0 ]
    then
        echo "git installation is not successful"
        exit 1
    else 
        echo "git installation is successful"
    fi
else
    echo "git is already installed,"
fi