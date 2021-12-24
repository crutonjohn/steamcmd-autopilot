FROM cm2network/steamcmd:root

LABEL maintainer="crutonjohn@pm.me"
ARG PUID=1000

ENV USER steam
ENV HOMEDIR "/home/${USER}"
ENV STEAMCMDDIR "${HOMEDIR}/steamcmd"

RUN apt-get update \
    && apt-get install expect -y \
    && apt-get remove --purge -y \
	wget \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

USER ${USER}

WORKDIR ${STEAMCMDDIR}

COPY --chown=${USER}:${USER} ./start.sh ${STEAMCMDDIR}
COPY --chown=${USER}:${USER} ./*.exp ${STEAMCMDDIR}

RUN chmod +x ${STEAMCMDDIR}/start.sh \
    && chmod +x ${STEAMCMDDIR}/anon.exp \
    && chmod +x ${STEAMCMDDIR}/login.exp

VOLUME ${STEAMCMDDIR}

CMD ${STEAMCMDDIR}/start.sh
