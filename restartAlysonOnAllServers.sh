#!/bin/bash

domainNames=("internmatch-dev.gada.io" "internmatch-demo.gada.io" "internmatch-pipeline.gada.io" "internmatch-staging.gada.io" "internmatch-adam2.gada.io" "stt-dev.gada.io" "stt-prod.gada.io" "stt-demo.gada.io");

# servers=("54.206.97.49" "13.211.83.117" "54.252.215.97" "13.211.147.163" "54.253.110.21");

declare -i n=1;

for NAME in "${domainNames[@]}"; do

    address=`nslookup $NAME | awk '/Address:/{i++}i==2' | grep 'Address:' | sed 's/^.*: //'`;

    # echo $address;

    printf "### IP Address No. $n:: $NAME (${address}) ### \n\n";

    ssh -o "StrictHostKeyChecking=no"  ubuntu@$address "(
        printf 'Server Name:: \n';
        kubectl get ing -o jsonpath='{..hosts}' |tr -s '[:space:]';
        printf '\n\n';
        printf 'Tag Name:: \n';
        #kubectl get pods -o jsonpath='{..image}' |tr -s '[[:space:]]' '\n' |sort|uniq|grep gennyproject;
        kubectl get pods -o jsonpath="{.items[*].spec.containers[].image}"|tr -s '[[:space:]]' '\n' |sort|uniq|grep gennyproject;
        printf '\n\n';
        printf 'Date:: \n';
        date +'%Y-%m-%d %H:%M:%S %Z';
        printf '\n\n';
        kubectl delete pod -l name=erstwhile-wolf-genny-alyson --force --grace-period=0
        printf '\n\n';
    )"

    n=$n+1;
done