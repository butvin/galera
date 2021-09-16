ARG VERSION_NGINX='1.21.3'
FROM nginx:${VERSION_NGINX}

ARG env

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

RUN rm /etc/nginx/conf.d/default.conf

COPY ./nginx/conf.d/${env}/ /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]