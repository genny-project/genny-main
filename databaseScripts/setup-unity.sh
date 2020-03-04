#!/bin/bash
docker exec -it alyson-v7 mkdir /usr/share/nginx/html/unity
docker exec -it alyson-v7  ls /usr/share/nginx/html/unity
docker cp ../../stt-unity/safeTrafficTown/Build/UnityLoader.js                  alyson-v7:/usr/share/nginx/html/unity/UnityLoader.js
docker cp ../../stt-unity/safeTrafficTown/Build/safeTrafficTown.data.unityweb           alyson-v7:/usr/share/nginx/html/unity/safeTrafficTown.data.unityweb
docker cp ../../stt-unity/safeTrafficTown/Build/safeTrafficTown.json                    alyson-v7:/usr/share/nginx/html/unity/safeTrafficTown.json
docker cp ../../stt-unity/safeTrafficTown/Build/safeTrafficTown.wasm.code.unityweb      alyson-v7:/usr/share/nginx/html/unity/safeTrafficTown.wasm.code.unityweb
docker cp ../../stt-unity/safeTrafficTown/Build/safeTrafficTown.wasm.framework.unityweb alyson-v7:/usr/share/nginx/html/unity/safeTrafficTown.wasm.framework.unityweb
docker exec -it  alyson-v7 ls /usr/share/nginx/html/unity
