#!/bin/bash

os_type=""
if [[ "$OSTYPE" == "linux-gnu" ]]; then
    os_type="ubuntu"
elif [[ "$OSTYPE" == "darwin"* ]]; then
    os_type="mac"
fi

echo "OS Type is ${os_type}"

if [[ "${os_type}" == "mac" ]]; then
    IP=$(ifconfig | grep 10.123.123.123)
elif [[ "${os_type}" == "ubuntu" ]]; then
    IP=$(ip a | grep 10.123.123.123)
fi
echo $IP

#if ping -c 1 10.123.123.123 &> /dev/null
if [[ -z "$IP" ]]; then
    if [[ ${os_type} == "mac" ]]; then
        echo "OS TYPE: macOS"
        sudo ifconfig lo0 alias 10.123.123.123
    elif [[ ${os_type} == "ubuntu" ]]; then
        echo "OS TYPE: Linux"
        sudo ip address add 10.123.123.123 dev lo
    else
        echo "Can't detect OS type, neither Linux nor macOS!"
        exit -1
    fi
else
    echo "10.123.123.123 exists"
fi

