#!/bin/bash
#!/bin/bash
count=0
while [[ $(ps aux | grep gennyteer) ]]
do
    count=$((count+1)) ;
    if [ $count -gt 1 ]
        then    
            docker kill gennyteer &
    fi
done
