# Postgres 10.12 Docker

This is a simple docker setup which can be used to quickly spin up a postgres instance populated with a existing db backup  
and some extensions installed.  
This is using the official Postgres 10.12 image in docker hub as the base image and it can be changed according the required version.
Only extra extension that is enabled on container start is PostGIS. This can also be customized by changing the `POSTGRES_EXTENSION`  
variable in `docker-compose`

# How to setup

## With an existing database backup

- You should have a database dump created using the `pg_dump` tool to begin with.
- Replace the dummy `db_backup` file in the backup folder with the actual backup.
- Change the env variable `POSTGRES_DB` in compose file to match the name of the database you are trying to restore.
- Run `docker-compose build` to create the image with the backup and init files included.
- Once the image is built, run `docker-compose up -d` to start the new container using the image you just created.

## Without an existing backup (A clean postgres instance)

You can use the same `docker-compose.yml` to spin up a clean postgres instance.  
To do this just remove the env variable `POSTGRES_DB` from the compose file and run `docker-compose up -d` and it will use the `postgres:10.12` from DockerHub to spin up the container.

## Connecting to the database

Once the container is running you can connect to it using the credentials and ports configured in the compose file. By default it will use below values and you can easily change credentials by editing the compose file and changing the environment variables.

```
HOST: localhost
USER: postgres
PASSWORD: password
```

# References

1. [Compose file Reference](https://docs.docker.com/compose/compose-file/)
2. [Dockerfile Reference](https://docs.docker.com/engine/reference/builder/)
3. [Official Postgres Docker in DockerHub](https://hub.docker.com/_/postgres/)
