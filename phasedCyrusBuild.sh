#!/bin/bash
set -e
parentdir="$(dirname $(pwd))"

function handle_exit_code() {
    EXIT_CODE=$1
    if [ $EXIT_CODE -ne 0 ]; then
        echo "Attention! Build failed."
        ./say.sh "Attention! Build failed"
        exit 1
    fi
}

function build() {
    project=$1
    echo $project
    cd $parentdir/$project
    ./build.sh
    EXIT_CODE=$(echo $?)
    handle_exit_code $EXIT_CODE
}

function build_docker() {
    project=$1
    echo $project
    cd $parentdir/$project
    ./build-docker.sh
    EXIT_CODE=$(echo $?)
    handle_exit_code $EXIT_CODE
}

if [ $# -eq 1 ]; then
    PROJECT=$1
elif [ $# -eq 0 ]; then
    echo "No project specified."
    read -p "Build everything? [y/n] : " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        PROJECT="qwanda"
    else
        echo "Nothing to build. Exiting.."
        exit 1
    fi
else
    echo "Building multiple projects in an adhoc manner might not be a good idea. Exiting."
    ./say.sh "Building multiple projects in an adhoc manner might not be a good idea. Exiting."
    exit 1
fi

endloop=false
while [ ${endloop} = false ]; do
    case ${PROJECT} in
    "qwanda") build "qwanda" && PROJECT="qwanda-utils" ;;
    "qwanda-utils") build "qwanda-utils" && PROJECT="bootxport" ;;
    "bootxport") build "bootxport" && PROJECT="genny-verticle-rules" ;;
    "genny-verticle-rules") build "genny-verticle-rules" && PROJECT="genny-rules" ;;
    "genny-rules") build "genny-rules" && PROJECT="qwanda-services" ;;
    "qwanda-services") build "qwanda-services" && PROJECT="wildfly-rulesservice" ;;
    "wildfly-rulesservice") build "wildfly-rulesservice" && build_docker "wildfly-rulesservice" && PROJECT="gennyq" ;;
    "gennyq") build "gennyq" && build_docker "gennyq" && PROJECT="checkrules" ;;
    "checkrules") build "checkrules" && build_docker "checkrules" && PROJECT="bootq" ;;
    "bootq") build "bootq" && build_docker "bootq" && PROJECT="genny-proxy" ;;
    "genny-proxy") build "genny-proxy" && build_docker "genny-proxy" && PROJECT="api2email" ;;
    "api2email") build "api2email" && build_docker "api2email" && PROJECT="gadaq" ;;
    "gadaq") build "gennyq/kogitoq/gadaq" && build_docker "gennyq/kogitoq/gadaq" && endloop=true ;;
    *) echo "Unknown project: ${PROJECT}. Exiting.." && handle_exit_code 1 ;;
    esac
done

cd $parentdir/genny-main

./cyrusBuildProducts.sh

cd $parentdir/genny-main
echo "Finished building all."
./say.sh "Completed building all!"
