FROM nginx:1.21.3

ARG env

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

RUN rm /etc/nginx/conf.d/default.conf

COPY ./nginx/conf.d/${env}/ /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]