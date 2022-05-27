FROM ghcr.io/k8s-at-home/ubuntu:latest

USER root

ENV APPDIR /app

COPY ./entrypoint.sh ${APPDIR}
COPY ./*.exp ${APPDIR}

RUN \
  apt-get -qq update \
  && \
  dpkg --add-architecture i386 \
  && \
  apt update \
  && \
  apt-get -qq install -y \
    lib32gcc-s1 \
    wget \
  && mkdir -p ${APPDIR}/.steam/sdk32 \
  && mkdir -p ${APPDIR}/linux32 \
  && mkdir -p ${APPDIR}/linux64 \
  && ln -s ${APPDIR}/linux32/steamclient.so ${APPDIR}/.steam/sdk32/steamclient.so \
  && ln -s ${APPDIR}/linux32/steamcmd ${APPDIR}/linux32/steam \
  && ln -s ${APPDIR}/steamcmd.sh ${APPDIR}/steam.sh \
  && ln -s ${APPDIR}/linux64/steamclient.so /usr/lib/x86_64-linux-gnu/steamclient.so \
  && wget -qO- 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar xvzf - -C "${APPDIR}" \
  && chown -R kah:kah /app \
  && \
  apt-get remove --purge --auto-remove -y \
    wget \
    software-properties-common \
  && \
  apt-get autoremove -y \
  && apt-get clean \
  && \
  rm -rf \
    /tmp/* \
    /var/lib/apt/lists/* \
    /var/tmp/ \
  && chown -R kah:kah /app \
  && chmod -R u=rwX,go=rX /app \
  && printf "umask %d" "${UMASK}" >> /etc/bash.bashrc \
  && update-ca-certificates \
  && chmod +x ${APPDIR}/entrypoint.sh \
  && chmod +x ${APPDIR}/anon.exp \
  && chmod +x ${APPDIR}/login.exp

USER kah

RUN \
  ${APPDIR}/steamcmd.sh +force_install_dir ${APPDIR} +quit

CMD ${APPDIR}/entrypoint.sh
