VERSION=$1
if [ -z $VERSION ];then
    echo "you need pass branch name as argument, e.g checkout.sh v7.1.0"
    exit 1
fi

parentdir="$(dirname `pwd`)"

for i in alyson qwanda qwandaq serviceq qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services  wildfly wildfly-qwanda-service wildfly-rulesservice bridge lauchy  checkrules prj_genny prj_internmatch prj_mentormatch prj_stt  media-proxy messages notes shleemy genny-proxy genny-main bootq sienna gennyteer qwandaq fyodor kogitoq2 api2email
do
    echo $i
    cd $parentdir/$i
    git pull ; git checkout $VERSION ; git pull
done

cd $parentdir/genny-main
