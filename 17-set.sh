#!/bin/bash

set -e # setting the automatic exit, if we get error, set -ex for debug
# set -ex

failure()
{
    echo "failed at: $1 : $2 "

}

trap 'failure "${LINENO}" "$BASH_COMMAND"' ERR # ERR is the error signal

echo "Hello World success"
echooooo "Hello world failure"
echo "Hello world after failure"