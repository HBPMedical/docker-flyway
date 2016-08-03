# docker-flyway

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
