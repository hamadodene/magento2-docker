#Magento utility docker file
ARG PHP_VERSION=php:8.0-fpm-alpine

FROM ${PHP_VERSION}

WORKDIR /var/www/html

#Install php extentions
RUN docker-php-install pdo pdo_mysql \
    bcmath \
    ctype \
    curl \
    dom \
    gd \
    hash \
    iconv \
    intl \
    mbstring \
    openssl \
    pdo_mysql \
    simplexml \
    soap \
    xsl \
    zip 

#Install package
RUN apk add --no-cache \
    vim \
    telnet \
    netcat \
    git-core \
    zip
    
