FROM boxfuse/flyway:5.1.4-alpine

MAINTAINER Ludovic Claude <ludovic.claude@chuv.ch>

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ENV DOCKERIZE_VERSION=v0.6.1

RUN apk add --no-cache --update wget shadow jq bash \
    && wget -O /tmp/dockerize.tar.gz "https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-alpine-linux-amd64-${DOCKERIZE_VERSION}.tar.gz" \
    && tar -C /usr/local/bin -xzvf /tmp/dockerize.tar.gz \
    && chown root:root /usr/local/bin/dockerize \
    && apk del wget \
    && rm -rf /var/cache/apk/* /tmp/*

COPY docker/flyway.conf.tmpl /flyway/conf/
COPY docker/run.sh /

# A simple test
RUN flyway 2>&1 | grep "Flyway Community Edition ${FLYWAY_VERSION}"
ENV PATH /flyway:$PATH \
    FLYWAY_DBMS=postgresql \
    FLYWAY_HOST=db \
    FLYWAY_PORT=5432 \
    FLYWAY_SCHEMAS=public
VOLUME /flyway/jars
VOLUME /flyway/sql


# Force the use of standard DNS resolver, Go re-implementation causes sometimes problems within Docker
# See https://golang.org/pkg/net/#hdr-Name_Resolution
ENV GODEBUG=netdns=cgo

ENTRYPOINT ["/run.sh"]
CMD ["--help"]

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="hbpmip/flyway" \
      org.label-schema.description="Flyway tool to manage database migrations" \
      org.label-schema.url="https://github.com/LREN-CHUV/docker-flyway" \
      org.label-schema.vcs-type="git" \
      org.label-schema.vcs-url="https://github.com/LREN-CHUV/docker-flyway.git" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.version="$VERSION" \
      org.label-schema.vendor="LREN CHUV" \
      org.label-schema.license="Apache2.0" \
      org.label-schema.docker.dockerfile="Dockerfile" \
      org.label-schema.schema-version="1.0"
