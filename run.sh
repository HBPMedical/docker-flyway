#!/usr/bin/env bash
if [ -z "$FLYWAY_HOST" ] || [ -z "$FLYWAY_DBMS" ]
then
    echo "usage: docker run lren/flyway with the following environment variables"
    echo
    echo "FLYWAY_DBMS: [required] Type of the database (oracle, postgres...)."
    echo "FLYWAY_HOST: [required] database host."
    echo "FLYWAY_PORT: database port."
    echo "FLYWAY_USER: database user."
    echo "FLYWAY_PASSWORD: database password."
    exit 1
fi

exec dockerize -wait tcp://${FLYWAY_HOST}:${FLYWAY_PORT:-5432} -template /flyway/conf/flyway.conf.tmpl:/flyway/conf/flyway.conf flyway $@
