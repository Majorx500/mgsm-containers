FROM eclipse-temurin:21-jdk

ENV UID=9201
ENV GID=9201

ENV GAME_VERSION="1.21.10"

ENV MEMORY_SIZE="4G"
ENV JAVA_ARGS="-XX:+UseContainerSupport"

RUN apt-get update && apt-get install -y jq wget curl gosu

EXPOSE 25565/tcp 25565/udp

COPY ./entrypoint.sh /opt/pmcserver/


VOLUME /data


RUN groupadd -r mgsm -g $GID  && useradd -ms /bin/bash -g mgsm -u $UID mgsm && chmod -R a+rw /data/ && chmod -R a+rw /opt/pmcserver

WORKDIR /data

ENTRYPOINT [ "/opt/pmcserver/entrypoint.sh" ]

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD nc -z 127.0.0.1 25565 || exit 1


