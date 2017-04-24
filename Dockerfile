FROM openjdk:8u121-jre-alpine

RUN apk update && apk add bash wget

ENV FLYWAY_VERSION=4.1.2 \
    DOCKERIZE_VERSION=v0.2.0

RUN wget -O /tmp/dockerize.tar.gz https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz \
    && tar -C /usr/local/bin -xzvf /tmp/dockerize.tar.gz \
    && rm /tmp/dockerize.tar.gz

RUN wget -O /tmp/flyway.zip http://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.zip \
     && unzip /tmp/flyway.zip \
     && rm /tmp/flyway.zip \
     && mv /flyway-${FLYWAY_VERSION} /flyway \
     && ln -s /flyway/flyway /usr/local/bin/flyway

COPY docker/flyway.conf.tmpl /flyway/conf/
COPY docker/run.sh /

# A simple test
RUN flyway 2>&1 | grep "Flyway ${FLYWAY_VERSION}"

ENV PATH /flyway:$PATH
WORKDIR /flyway
VOLUME /flyway/jars
VOLUME /flyway/sql

ENTRYPOINT ["/run.sh"]
CMD ["--help"]
