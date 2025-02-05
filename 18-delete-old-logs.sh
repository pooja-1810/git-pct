#!/bin/bash

SOURCE_DIR=/c/devops/daws-81s/logs

if [ -d $SOURCE_DIR ]
then 
    echo "$SOURCE_DIR Exists"
else
    echo "$SOURCE_DIR does not exists"
    exit 1
fi

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +14)
echo "Files : $FILES"

while IFS= read -r line #IFS,internal field separator, empty it   will ignore white spaces. -r is for not to ignore special charaters like /
do
    echo "Deleting line: $line"
done <<< $FILES