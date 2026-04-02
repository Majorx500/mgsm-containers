FROM debian:12

ENV UID=9201
ENV GID=9201

RUN apt-get update && apt-get install -y curl wget lib32gcc-s1 gosu tini

COPY --chown=${UID}:${GID} ./entrypoint.sh /opt/steamcmd/


VOLUME [ "/steamcmd" ]

RUN groupadd -r mgsm -g $GID  && useradd -lms /bin/bash -g mgsm -u $UID mgsm && chmod -R +rw /steamcmd && chmod -R +rw /opt/steamcmd

WORKDIR /steamcmd

ENTRYPOINT [ "/usr/bin/tini" ]

CMD [ "/opt/steamcmd/entrypoint.sh" ]


