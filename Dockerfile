FROM alpine:latest AS production

COPY ./SETUP_FILES /root/

RUN sh ~/install.sh

# CONFIGURE SERVER
ENV BDSROOT='/opt/bdxcore' \
    DATADIR='/data' \
    BDXCDIR='/data/Plugin_Files/bdxcore_mod' \
    BDXCNET='/data/Plugin_Files/csr' \
    BDXCNJS='/data/Plugin_Files/netjs' \
    BDXCIPY='/data/Plugin_Files/ipy' \
    BDXC_PY='/data/Plugin_Files/py' \
    BDXCDLL='/data/Core_Dll' \
    ## Location for default server config files (permissions.json, server.properties & whitelist.json)
    BDSCONF='/data/server_config' \
    ## Location for the BDXCore Mod/Plugin Config Directory
    BDXCCFG='/data/config' \
    ## Location for the BDXCore Mod/Plugin Plugins Directory
    BDXCPLG='/data/plugins' \
    BDS_BPK='/data/behavior_packs' \
    BDS_RPK='/data/resource_packs' \
    BDS_WLD='/data/worlds'

# CONFIGURE TIMEZONE TO UTC
ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY ./script ${BDSROOT}

# INSTALL REQUIRE SOFTWARE
RUN echo "http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/main" > /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/v$(cat /etc/alpine-release | cut -d'.' -f1,2)/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

RUN apk update && \
    apk add --no-cache freetype nano rsync tzdata unzip wget wine wine-dev wine-libs wine-mono && \
    apk add --no-cache --upgrade bash && \
    wget https://minecraft.azureedge.net/bin-win/bedrock-server-1.16.101.01.zip && \
    unzip bedrock-server-1.16.101.01.zip -d ${BDSROOT}

RUN chmod +x ${BDSROOT}/BDXCore-DockerEntry.sh && \
    sh ~/bdsInstall.sh

VOLUME ${DATADIR}

WORKDIR $BDSROOT

EXPOSE  19132/udp \
        19133/udp 

EXPOSE  19132/tcp \
        19133/tcp \
        80/tcp

RUN ln -sb /usr/bin/wine64 /usr/bin/wine

ENTRYPOINT $BDSROOT/BDXCore-DockerEntry.sh