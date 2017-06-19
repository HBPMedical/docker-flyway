#!/usr/bin/env bash

DOCKERIZE_OPTS=""

if [ ! -z "$@" ]; then
    if [ -z "$FLYWAY_HOST" ] || [ -z "$FLYWAY_DBMS" ]
    then
        echo "usage: docker run hbpmip/flyway with the following environment variables"
        echo
        echo "FLYWAY_DBMS: [required] Type of the database (oracle, postgres...)."
        echo "FLYWAY_HOST: [required] database host."
        echo "FLYWAY_PORT: database port."
        echo "FLYWAY_USER: database user."
        echo "FLYWAY_PASSWORD: database password."
        exit 1
    else
        DOCKERIZE_OPTS="-wait tcp://${FLYWAY_HOST}:${FLYWAY_PORT:-5432} -timeout 60s -template /flyway/conf/flyway.conf.tmpl:/flyway/conf/flyway.conf"
    fi
fi

# Force the use of standard DNS resolver, Go re-implementation causes sometimes problems within Docker
# See https://golang.org/pkg/net/#hdr-Name_Resolution
export GODEBUG=netdns=cgo

exec dockerize $DOCKERIZE_OPTS flyway $@
