
clean=$1
parentdir="$(dirname `pwd`)"

for value in checkrules notes shleemy bootq genny-proxy kogitoq2 api2email 
do
    echo $value
#    rm -Rf  $parentdir/$value/target/*
    cd $parentdir/$value
    mvn  $clean  package -DskipTests=true
#    ./build-docker.sh
done


for value in checkrules notes shleemy bootq genny-proxy kogitoq2 api2email messages
do
    echo $value
    cd $parentdir/$value
    ./build-docker.sh
done
