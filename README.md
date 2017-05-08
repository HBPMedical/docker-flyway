[![CHUV](https://img.shields.io/badge/CHUV-LREN-AF4C64.svg)](https://www.unil.ch/lren/en/home.html) [![License](https://img.shields.io/badge/license-Apache--2.0-blue.svg)](https://github.com/LREN-CHUV/docker-flyway/blob/master/LICENSE) [![DockerHub](https://img.shields.io/badge/docker-hbpmip%2Fflyway-008bb8.svg)](https://hub.docker.com/r/hbpmip/flyway/) [![CircleCI](https://circleci.com/gh/LREN-CHUV/docker-flyway/tree/master.svg?style=svg)](https://circleci.com/gh/LREN-CHUV/docker-flyway/tree/master) [![ImageVersion](https://images.microbadger.com/badges/version/hbpmip/flyway.svg)](https://hub.docker.com/r/hbpmip/flyway/tags "hbpmip/flyway image tags") [![ImageLayers](https://images.microbadger.com/badges/image/hbpmip/flyway.svg)](https://microbadger.com/#/images/hbpmip/flyway "hbpmip/flyway on microbadger")


# docker-flyway

Flyway is a database migration tool.
This is a docker image that eases setup and use of Flyway.

## About Flyway

> Flyway is an open-source database migration tool. It strongly favors simplicity and convention over configuration.

From: [Documentation - Flyway • Database Migrations Made Easy.](http://flywaydb.org/documentation/)

## Install

This docker image is available as an automated build on [the docker registry hub](https://registry.hub.docker.com/u/hbpmip/flyway/), so using it is as simple as running:


```console
$ docker run hbpmip/flyway:4.2.0-0
```

## Usage

Run:
```console
$ docker run -i -t --rm -e FLYWAY_DBMS=postgres -e FLYWAY_HOST=`hostname` -v `pwd`/sql:/flyway/sql hbpmip/flyway:4.2.0-0 migrate
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
* FLYWAY_MIGRATION_PACKAGE: additional Java package containing migration classes.

In the container, the following directories have special meaning:

* /flyway/sql: this directory should contain SQL migrations.
* /flyway/jars: this directory should contain Java migrations packaged as jar files.

## Build

Run: `./build.sh`

## Publish on Docker Hub

Run: `./publish.sh`

## License

### Docker packaging

(this project)

Copyright (C) 2010-2017 [LREN CHUV](https://www.unil.ch/lren/en/home.html)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Initial packaging done by suin <suinyeze@gmail.com>

### Flyway

Copyright (C) 2016-2017 [Boxfuse GmbH](https://boxfuse.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

## Trademark
Flyway is a registered trademark of [Boxfuse GmbH](https://boxfuse.com).
