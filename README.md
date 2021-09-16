### **IO**

`docker system prune -af`

`docker rmi $(docker images -qa)`

`docker volume rm $(docker volume ls -q)`

`docker network rm $(docker network ls -q)`


    docker stop $(docker ps -a -q); docker rm $(docker ps -a -q); docker volume rm $(docker volume ls -qf dangling=true)

    docker network rm $(docker network ls -q)

    sudo lsof -nP | grep LISTEN

    sudo kill -9 1548


    sudo systemctl stop docker


    sudo systemctl start docker


    docker ps -a -s (with size)



<hr>    
docker run -it --add-host db-static:86.75.30.9 ubuntu cat /etc/hosts

`add localhost`



<hr>


    $ docker run --name mariadb -e ALLOW_EMPTY_PASSWORD=yes bitnami/mariadb:latest

    $ curl -sSL https://raw.githubusercontent.com/bitnami/bitnami-docker-mariadb/master/docker-compose.yml > docker-compose.yml
    $ docker-compose up -d




<hr>
<p style="background: tomato;">
    docker exec -t php-fpm bash -c 'php bin/console fos:user:create dev dev.name@mail.org dev --super-admin'
</p>


    `   docker stop (docker ps -qa) \
        && docker rm (docker ps -qa) \
        && make`

    >> #!bin/bash
    >> HTTPDUSER=$(ps axo user,comm | grep -E '[a]pache|[h]ttpd|[_]www|[w]ww-data|[n]ginx' | grep -v root | head -1 | cut -d\ -f1) `
    >> sudo setfacl -dR -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var
    >> sudo setfacl -R -m u:"$HTTPDUSER":rwX -m u:$(whoami):rwX var



`docker exec -t php-fpm bash -c 'php bin/console fos:user:create 'name' 'email@com.org' 'password' --super-admin'
`


`composer require --dev debug`


	docker stop $(docker ps -q -a) \
    && docker rm $(docker ps -q -a) \
    && make


    docker-php-ext-configure



<b>docker system df -v</b> - <i>displays information regarding the amount of disk space used by the docker daemon</i>



<hr>

<b>docker system df</b>         Show docker disk usage
<b>docker system events</b>     Get real time events from the server
<b>docker system info</b>       Display system-wide information
<b>docker system prune</b>      Remove unused data




```docker stop $(docker ps -qa) && docker rm $(docker ps -qa) && make```

