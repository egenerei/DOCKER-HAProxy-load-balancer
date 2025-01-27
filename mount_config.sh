#! /bin/bash
docker exec -t webserver1 apt update
docker exec -t webserver1 apt install nfs-client -y
docker exec -t webserver1 mount -o vers=4,loud 192.168.2.100:/ /usr/share/nginx/html &
sleep 20
# docker exec -t webserver1 cp /mnt/index.html /usr/share/nginx/html/index.html
docker exec -t webserver1 cat /usr/share/nginx/html/index.html
docker exec -t webserver2 apt update
docker exec -t webserver2 apt install nfs-client -y
docker exec -t webserver2 mount -o vers=4,loud 192.168.2.100:/ /usr/share/nginx/html &
sleep 20
# docker exec -t webserver2 cp /mnt/index.html /usr/share/nginx/html/index.html
docker exec -t webserver2 cat /usr/share/nginx/html/index.html