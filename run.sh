echo $1
./stop.sh; docker volume prune; ./run-setup.sh -p $1 -r $1 $2
