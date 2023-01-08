ARG PHP_VERSION=php:7.4-fpm

FROM ${PHP_VERSION}

WORKDIR /var/www/html/magento

# Install dependencies
RUN apt-get update \
  && apt-get install -y curl 

 # Install magerun
RUN curl -o magerun https://raw.githubusercontent.com/netz98/n98-magerun/master/n98-magerun.phar && \
    chmod +x ./magerun && \
    ./magerun selfupdate && \
    cp ./magerun /usr/local/bin/ && \
    rm ./magerun

ENTRYPOINT [ "magerun" ]


