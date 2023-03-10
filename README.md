# Multi magento setup in same server for development

This repo allows you to initialize multiple magento containers on the same machine.


The architecture can be seen as the following:
![magento_dev drawio](https://user-images.githubusercontent.com/43852233/211872788-51f124f6-5382-4947-9738-9a1f4dc9efcc.png)




## First setup

elastisearch, mariadb and reverse-proxy services need to be started only at the first server setup.
The first setup can be done using the script first-setup as follow:
```
./first-setup
```
Use docker command to check If everything is ok. Commands like:
- **docker ps** --> to list running services
- **docker logs -f container_name** --> to check service log


You may need to change the mariadb and elasticsearch environment variables. Feel free to do this by editing the **mariadb.env** and **elastic.env** files.

You might need to change the permissions of the magento user before creating a magento container.
To do this you can connect to the phpmyadmin interface to set the permissions.

## Start magento

The magento container is based on the bitnami magento image that you can find on the official bitnami repo (https://hub.docker.com/r/bitnami/magento/). Also in this case a **magento.env** file is provided to act on the configuration. For the available configs see the official bitnami magento repo.

I have already provided a simple script that can guide you in creating a magento service.
It is assumed in this case that you have not made any changes and are therefore using all configurations as is.
If you decide to make changes you will obviously need to edit the script.

```
./setup-magento
```

**NOTE:** This is all for working in a test environment, so you can use it as-is without making any changes. Just run using the scripts.


## Usefull commands

#### Create admin user
```
docker exec -u daemon -w /bitnami/magento  -i $container_name  php bin/magento admin:user:create --admin-user=admin --admin-password=admin123 --admin-email=admin@example.com --admin-firstname=admin --admin-lastname=admin
```
#### Add new reposity in composer.json file
```
docker exec -u daemon  -w /bitnami/magento -i $container_name composer config repositories.repo-name vcs https://github.com/<orgname or username>/repo
```
#### Add magento auth and github auth

```
docker exec  -u daemon -w /bitnami/magento -i $container_name composer config http-basic.repo.magento.com <public_key> <private_key>
```

```
docker exec -u daemon -w /bitnami/magento -i $container_name composer config github-oauth.github.com <github_token>
```
