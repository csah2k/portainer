#!/bin/bash
docker pull portainer/portainer-ee:latest
docker run -d \
    -p 8000:8000 \
    -p 9000:9000 \
    -p 9443:9443 \
    --name=portainer \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /home/csah2k/portainer/certs:/certs \
    -v portainer_data:/data \
    portainer/portainer-ee:latest \
    --sslcert /certs/portainer.crt \
    --sslkey /certs/portainer.key

docker pull portainer/agent:latest
docker run -d \
    -p 9001:9001 \
    --name portainer_agent \
    --restart=always \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v /var/lib/docker/volumes:/var/lib/docker/volumes \
    portainer/agent:latest    