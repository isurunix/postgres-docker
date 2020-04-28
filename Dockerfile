FROM postgres:10.12

ADD backup/db_backup /
ADD init.sh /docker-entrypoint-initdb.d/init.sh

RUN apt-get update && apt-get upgrade -y && apt-get install -y postgresql-10-postgis-3-scripts

EXPOSE 5432