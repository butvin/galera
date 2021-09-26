ARG VERSION_NGINX='1.21.3'
FROM nginx:${VERSION_NGINX}

ARG env

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

RUN rm /etc/nginx/conf.d/default.conf

COPY ./nginx/conf.d/${env}/ /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]


#ARG DATA_STORAGE='.dbdata'
#RUN mkdir ./$DATA_STORAGE
#RUN chown $(whoami):$(whoami) -R /app/.docker/$DATA_STORAGE
#RUN mkdir $DATA_STORAGE
#RUN chown $(whoami):$(whoami) -R /app/.docker/$DATA_STORAGE
#RUN chmod 777 -R $DATA_STORAGE
#RUN chown 'www-data':'www-data' /app/.docker/$DATA_STORAGE -R
#COPY ../../run.sh /run.sh
#RUN chmod +x /run.sh
#RUN chmod 777 /app/.docker/.data -R
#ADD ./.data/ /var/lib/mysql
#RUN chown $(whoami):$(whoami) -R /app/.docker/$DATA_STORAGE