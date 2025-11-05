# docker (sudo)
docker pull debian:trixie # Pull image
docker images

docker run -dit --name <container-name> debian:trixie # Create image
docker ps -a # List 
docker start <container-name> # Start container
docker exec -it <container-name> bash # Bash

docker logs <container-name>

exit # Exit
docker stop <container-name> 
docker rm <container-name> # Remove container

docker rmi debian:trixie # Remove image
