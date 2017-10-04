#!/bin/bash
if [ -z "$1" ];then 
echo "No ip supplied, determining local host ip ...."
myip=
while IFS=$': \t' read -a line ;do
    [ -z "${line%inet}" ] && ip=${line[${#line[1]}>4?1:2]} &&
        [ "${ip#127.0.0.1}" ] && myip=$ip
  done< <(LANG=C /sbin/ifconfig)


if [ -z "${myip}" ]; then
   myip=127.0.0.1
fi

else 
echo "ip supplied... $1"
myip=$1

fi
echo $myip
docker run -it --rm -e myip=$myip tobert/cassandra cqlsh $myip

