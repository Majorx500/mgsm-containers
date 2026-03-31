FROM debian:12

RUN apt-get update -y && apt-get install -y software-properties-common && apt-add-repository non-free \
  && dpkg --add-architecture i386 && apt-get update -y && apt-get install -y curl wget \
  && rm -rf /var/lib/apt/lists/*


