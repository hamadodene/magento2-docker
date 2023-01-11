This repo allows you to initialize multiple magento containers on the same machine.

The architecture can be seen as the following:
![magento_dev drawio](https://user-images.githubusercontent.com/43852233/211872788-51f124f6-5382-4947-9738-9a1f4dc9efcc.png)


elastisearch, mariadb and reverse-proxy services need to be started only at the first server setup.
The steps for the first setup is as follows:

- clone this repository
- Start reverse proxy
```
cd reverse-proxy
docker compose up -d
```
- start elasticsearch and mariadb
```
cd components
docker compose up -d
```
You may need to change the mariadb and elasticsearch environment variables. Feel free to do this by editing the **mariadb.env** and **elastic.env** files.

- Now you can start your magento.

The magento container is based on the bitnami magento image that you can find on the official bitnami repo (https://hub.docker.com/r/bitnami/magento/). Also in this case a **magento.env** file is provided to act on the configuration. For the available configs see the official bitnami magento repo.

Important note: If you want to start more magento containers, it is advisable to provide a new container name, a new MAGENTO_HOST , a new VIRTUAL_HOST and of course a new MAGENTO_DATABASE_NAME.

```
cd magento
docker compose up -d
```
