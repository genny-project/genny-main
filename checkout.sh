VERSION=v7.1.0
for i in ` find .. -mindepth 1 -maxdepth 1 -type d | awk -F "/" '{ print $2 }'`;do
    cd ../$i
    git pull ; git checkout $VERSION
    cd ../genny-main
    echo $i
done
