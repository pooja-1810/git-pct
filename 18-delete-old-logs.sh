#!/bin/bash

SOURCE_DIR=/c/devops/daws-81s/logs

If [ -d $SOURCE_DIR ]
then 
    echo "$SOURCE_DIR Exists"
else
    echo "$SOURCE_DIR does not exists"
    exit 1
fi