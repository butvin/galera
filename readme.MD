docker system prune -af


docker rmi $(docker images -qa)


docker volume rm $(docker volume ls -q)


docker exec -t php-fpm bash -c 'php bin/console fos:user:create dev dev.name@mail.org dev --super-admin'


docker stop $(docker ps -qa) && docker rm $(docker ps -qa) && make
docker stop (docker ps -qa) && docker rm (docker ps -qa) && make



#!bin/bash
HTTPDUSER=$(ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\  -f1)
sudo setfacl -dR -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var
sudo setfacl -R -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var
<<<<<<< HEAD
docker exec -t php-fpm bash -c 'php bin/console fos:user:create dev developer.name@mail.org dev --super-admin'
=======
docker exec -t php-fpm bash -c 'php bin/console fos:user:create dev dev.name@mail.org dev --super-admin'
>>>>>>> 00e3bdaa37d99424e3dc480433709d3f8a6a13ac


composer require --dev debug
