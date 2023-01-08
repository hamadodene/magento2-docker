FROM alpine:latest

WORKDIR /var/www/html/magento
#Install tools
#Install package
RUN apk add --no-cache \
    vim \
    telnet \
    netcat \
    git-core \
    zip \
    curl

 # Install magerun
RUN curl -o magerun https://raw.githubusercontent.com/netz98/n98-magerun/master/n98-magerun.phar && \
    chmod +x ./magerun && \
    ./magerun selfupdate && \
    cp ./magerun /usr/local/bin/ && \
    rm ./magerun

ENTRYPOINT [ "magerun" ]


