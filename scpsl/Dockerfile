FROM ghcr.io/majorx500/steamcmd-mgsm:latest

ENV GAMEID=996560

RUN apt-get install -y ca-certificates gnupg && gpg --homedir /tmp --no-default-keyring --keyring /usr/share/keyrings/mono-official-archive-keyring.gpg --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF && echo "deb [signed-by=/usr/share/keyrings/mono-official-archive-keyring.gpg] https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list && apt-get update && apt-get install -y mono-complete

COPY ./entrypoint.sh /opt/scpsl/

VOLUME [ "/data" ]

WORKDIR /data

EXPOSE 7777/tcp 7777/udp

ENTRYPOINT [ "/opt/scpsl/entrypoint.sh" ]
