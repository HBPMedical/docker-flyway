# docker-flyway

[![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/LREN-CHUV/docker-flyway/blob/master/LICENSE) [![DockerHub](https://img.shields.io/badge/docker-lren%2Fflyway-008bb8.svg)](https://hub.docker.com/r/lren/flyway/) [![](https://images.microbadger.com/badges/version/lren/flyway.svg)](https://hub.docker.com/r/lren/flyway/tags "lren/flyway image tags") [![](https://images.microbadger.com/badges/image/lren/flyway.svg)](https://microbadger.com/#/images/lren/flyway "lren/flyway on microbadger")

Flyway is a database migration tool.
This is a docker image that eases setup.

## About Flyway

> Flyway is an open-source database migration tool. It strongly favors simplicity and convention over configuration.

From: [Documentation - Flyway • Database Migrations Made Easy.](http://flywaydb.org/documentation/)

## Install

This docker image is available as an automated build on [the docker registry hub](https://registry.hub.docker.com/u/lren/flyway/), so using it is as simple as running:


```console
$ docker run lren/flyway
```

## Usage

```
$ docker run -i -t --rm -e FLYWAY_DBMS=postgres -e FLYWAY_HOST=`hostname` -v `pwd`/sql:/flyway/sql lren/flyway migrate
```

where the environment variables are:

* FLYWAY_DBMS: [required] Type of the database (oracle, postgres...).
* FLYWAY_HOST: [required] database host.
* FLYWAY_PORT: database port.
* FLYWAY_DATABASE_NAME: name of the database or schema
* FLYWAY_URL: JDBC url to the database, constructed by default from FLYWAY_DBMS, FLYWAY_HOST, FLYWAY_PORT and FLYWAY_DATABASE_NAME
* FLYWAY_DRIVER: Fully qualified classname of the jdbc driver (autodetected by default based on flyway.url)
* FLYWAY_USER: database user.
* FLYWAY_PASSWORD: database password.
* FLYWAY_SCHEMAS: Comma-separated list of schemas managed by Flyway
* FLYWAY_TABLE: Name of Flyway's metadata table (default: schema_version)
