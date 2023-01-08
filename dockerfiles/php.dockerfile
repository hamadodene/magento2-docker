ARG PHP_VERSION=php:8.0-fpm-alpine

FROM ${PHP_VERSION}

WORKDIR /var/www/html

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

RUN addgroup -g 1000 magento && adduser -G magento -g magento -s /bin/sh -D magento

USER magento

RUN chown -R magento:magento /var/www/html

USER magento

ENTRYPOINT [ "php" ]