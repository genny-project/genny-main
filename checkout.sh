VERSION=$1
if [[ -z $VERSION ]];then
    echo "you need pass branch name as argument, e.g checkout.sh v7.1.0"
    exit 1
fi

for i in ` find .. -mindepth 1 -maxdepth 1 -type d | awk -F "/" '{ print $2 }'`;do
    cd ../$i
    git pull ; git checkout $VERSION
    cd ../genny-main
    echo $i
done
