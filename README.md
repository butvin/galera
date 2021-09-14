### **IO Systems**

`docker system prune -af`

`docker rmi $(docker images -qa)`

`docker volume rm $(docker volume ls -q)`


<p style="background: tomato;">
    docker exec -t php-fpm bash -c 'php bin/console fos:user:create dev dev.name@mail.org dev --super-admin'
</p>


```docker stop $(docker ps -qa) && docker rm $(docker ps -qa) && make```


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
