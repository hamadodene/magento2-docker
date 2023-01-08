ARG PHP_VERSION=php:7.4-fpm-alpine

FROM ${PHP_VERSION}

WORKDIR /var/www/html/magento

# Install dependencies
RUN apt-get update \
  && apt-get install -y \
    libfreetype6-dev \ 
    libicu-dev \ 
    libjpeg62-turbo-dev \ 
    libmcrypt-dev \ 
    libpng-dev \ 
    libxslt1-dev \ 
    sendmail-bin \ 
    sendmail \ 
    sudo \ 
    libzip-dev \ 
    libonig-dev

# Configure the gd library
RUN docker-php-ext-configure \
  gd --with-freetype --with-jpeg

# Install required PHP extensions

RUN docker-php-ext-install \
  dom \ 
  gd \ 
  intl \ 
  mbstring \ 
  pdo_mysql \ 
  xsl \ 
  zip \ 
  soap \ 
  bcmath \ 
  pcntl \ 
  sockets

RUN chown -R www-data:www-data /var/www/html/magento

# Configure
COPY ./config/php/php.ini /usr/local/etc/php/php.ini
COPY ./config/php/php-fpm.conf /usr/local/etc/

ENTRYPOINT [ "php" ]