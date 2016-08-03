FROM java:8u92-jre-alpine

RUN apk update && apk add bash

ENV FLYWAY_VERSION 4.0.3
ADD http://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.zip /flyway.zip

RUN unzip /flyway.zip && rm /flyway.zip && mv /flyway-${FLYWAY_VERSION} /flyway && ln -s /flyway/flyway /usr/local/bin/flyway

# A simple test
#RUN flyway 2>&1 | grep "Flyway ${FLYWAY_VERSION}"

ENV PATH /flyway:$PATH
WORKDIR /flyway
VOLUME /flyway/jars
VOLUME /flyway/sql

ENTRYPOINT ["flyway"]
CMD ["--help"]
