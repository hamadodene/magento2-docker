
https://linuxhandbook.com/nginx-reverse-proxy-docker/

https://github.com/nginx-proxy/nginx-proxy

https://github.com/echo-magento/docker-magento2


Con questo posso avere un singolo reverse nginx con molteplici container magento, ognuno con il proprio virtual host

# Idea

- Uno script che scarica magento e fa tutto il setup
- Un Dockerfile che fa partire nginx con php,magerun e composer
- Un Dockerfile per Mysql
- Un Dockerfile per elasticsearch