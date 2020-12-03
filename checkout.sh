VERSION=$1
if [ -z $VERSION ];then
    echo "you need pass branch name as argument, e.g checkout.sh v7.1.0"
    exit 1
fi

parentdir="$(dirname `pwd`)"

for i in alyson qwanda qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services wildfly wildfly-qwanda-service wildfly-rulesservice bridge checkrules prj_genny prj_internmatch media-proxy messages notes shleemy genny-proxy genny-main
do
    echo $i
    cd $parentdir/$i
    git pull ; git checkout $VERSION ; git pull
done
