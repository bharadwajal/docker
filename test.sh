#!/bin/bash


if lsof -Pi :80 -sTCP:LISTEN -t > /var/lib/jenkins/users/bj/wait_results; then
    echo "running"
else
    echo "not running"
fi

