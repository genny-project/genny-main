VERSION=$1
if [ -z $VERSION ];then
    echo "you need pass branch name as argument, e.g checkout.sh 10.0.0"
    exit 1
fi

git fetch
git checkout $VERSION
git pull

parentdir="$(dirname `pwd`)"

for i in alyson qwanda qwandaq serviceq qwanda-utils bootxport genny-verticle-rules genny-rules qwanda-services wildfly wildfly-qwanda-service wildfly-rulesservice bridge dropkick lauchy fyodor adi media-proxy messages notes shleemy genny-proxy genny-main bootq sienna gennyteer kogitoq2 api2email checkrules prj_genny prj_internmatch prj_mentormatch prj_stt 
do
    echo $i
    cd $parentdir/$i
    git fetch ; git checkout $VERSION ; git pull
done

cd $parentdir/genny-main
