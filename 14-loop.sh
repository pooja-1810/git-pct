#!/bin/bash

R="\e[31m"
G="\e[32m"
N="\e[0m"
USERID=$(id -u)
#echo "user id is $USERID"

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

for package in $@ # $@ refers to all arguments passed to it
do
    dnf list installed $package
    if [ $? -ne 0 ]
    then
        echo "$package is not installed, going to install it"
        dnf install $package -y
        VALIDATE $? "Installing $package"
    else
        echo "$package is already installed,"
    fi
done

