ARG PHP_VERSION=7.4

FROM  php:${PHP_VERSION}-fpm-alpine

#Install tools
RUN apk add --update --no-cache \
    curl \
    wget \
	nginx \
	zlib-dev \
	libpng-dev \
	icu-dev \
	libxml2-dev \
	libxslt-dev \
	libzip-dev

#Install php extension
RUN docker-php-ext-install pdo pdo_mysql \
  	opcache \
  	bcmath \
  	gd \
  	intl \
  	mysqli \
  	pdo_mysql \
  	soap \
  	xsl \
  	zip \
  	sockets

# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

 # Install magerun
RUN curl -o magerun https://raw.githubusercontent.com/netz98/n98-magerun/master/n98-magerun.phar && \
    chmod +x ./magerun && \
    ./magerun selfupdate && \
    cp ./magerun /usr/local/bin/ && \
    rm ./magerun && \
	rm ./n98-magerun.phar 

#Php configuration
COPY ./config/php.ini /usr/local/etc/php/php.ini
RUN sed -i \
  -e "s/listen = 127.0.0.1:9000/listen = \/var\/run\/php-fpm.sock/g" \
  -e "s/;listen.mode = 066/listen.mode = 0666/g" \
  /usr/local/etc/php-fpm.d/www.conf

# Nginx configuration
WORKDIR /etc/nginx/http.d
COPY ./config/nginx.conf .
RUN mv nginx.conf default.conf

# Installer file
COPY ./config/magento-install /usr/local/bin
RUN chmod u+x /usr/local/bin/magento-install 


# Setup workdir
WORKDIR /var/www/html

#User for app
RUN addgroup -S www-data www-data

RUN chown -R www-data:www-data /var/www/html

EXPOSE 80

CMD ["/bin/bash", "-c", "php-fpm && chmod 777 /var/run/php/php-fpm.sock && nginx -g 'daemon off;'"]
#  CMD ["nginx", "-g", "daemon off;"]
