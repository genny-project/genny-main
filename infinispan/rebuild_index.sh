#!/bin/bash

caches=`curl --digest -u genny:password http://alyson.genny.life:11222/rest/v2/caches/ | awk '{print substr($0,2,length($0)-2)}'`

echo "Rebuilding indexes for the caches: [ $caches ]"

IFS=',';
for cache in $caches;
do
  cacheName=`echo $cache | sed -e 's/^"//' -e 's/"$//'`
  echo "\nRebuilding index for cache: $cacheName";
  curl -d "" --digest -u genny:password http://alyson.genny.life:11222/rest/v2/caches/$cacheName/search/indexes\?action=reindex;
done

