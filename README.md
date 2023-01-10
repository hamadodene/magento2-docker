
https://linuxhandbook.com/nginx-reverse-proxy-docker/

https://github.com/nginx-proxy/nginx-proxy

https://github.com/echo-magento/docker-magento2


Con questo posso avere un singolo reverse nginx con molteplici container magento, ognuno con il proprio virtual host

# Idea

- Uno script che scarica magento e fa tutto il setup
- Un Dockerfile che fa partire nginx con php,magerun e composer
- Un Dockerfile per Mysql
- Un Dockerfile per elasticsearch

# Starting process

- Use composer utility to dowload magento version you need or dowload it manually where you want and copy all files in src folder
```
docker compose build composer
docker compose run composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition .
```

- Build container for run magento and start container
```
# note: edit VIRTUAL_HOST to setup the right host for you
docker composer build magento
docker compose run magento
```

- Run script magento install to install all things need for magento.
```
docker exec -it magento_container_name magento-install project_name base_url db_name db_user db_password admin_email
```