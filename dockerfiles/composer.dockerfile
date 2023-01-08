#Composer utility docker file
FROM composer:latest

RUN addgroup -g 1000 magento && adduser -G magento -g magento -s /bin/sh -D magento

USER magento

WORKDIR /var/www/html

ENTRYPOINT [ "composer" ]