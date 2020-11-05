VERSION=$1
if [ -z $VERSION ];then
    echo "you need pass branch name as argument, e.g checkout.sh v7.1.0"
    exit 1
fi

for i in alyson qwanda qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services wildfly wildfly-qwanda-service wildfly-rulesservice bridge checkrules media-proxy messages notes abn-lite
do
    echo $i
    cd ../$i
    git pull ; git checkout $VERSION ; git pull
    cd ../genny-main
done
