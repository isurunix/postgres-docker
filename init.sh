#!/bin/bash

PGPASSWORD="$POSTGRES_PASSWORD" pg_restore -U postgres --dbname="$POSTGRES_DB" \
    --verbose /db_backup
