FROM eclipse-temurin:21-jdk

ENV GAME_VERSION="1.21.10"

ENV MEMORY_SIZE="4G"
ENV JAVA_ARGS="-XX:+UseContainerSupport"

RUN apt-get update && apt-get install jq wget curl 

EXPOSE 25565/tcp 25565/udp

VOLUME /data

WORKDIR /data

COPY ./base_docker.sh /opt/papermc/

ENTRYPOINT [ "/opt/papermc/base_docker.sh" ]

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD nc -z 127.0.0.1 25565 || exit 1


