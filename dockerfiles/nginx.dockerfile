#Dockerfile for setup nginx
FROM nginx:stable-alpine

WORKDIR /etc/nginx/conf.d

COPY ./config/nginx/nginx.conf .

RUN mv nginx.conf default.conf

