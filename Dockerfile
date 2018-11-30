FROM frolvlad/alpine-glibc

# ! runs into many "command not found" or "unrecognized option" errors -> not worth the effort, use a supported docker container

RUN apk add --no-cache \
    jq \
    tmux \
    git \
    bash \
    curl wget \
    unzip gzip bzip2 \
    binutils \
    bc \
    bsdmainutils \
    jq \
    libstdc++6


# switch to user steam
RUN adduser -D -s /bin/bash steam
USER steam

RUN git clone "https://github.com/GameServerManagers/LinuxGSM.git" /home/steam/linuxgsm \
    && git clone "https://github.com/GameServerManagers/Game-Server-Configs.git" /home/steam/linuxgsm-configs

RUN cd linuxgsm && ./linuxgsm.sh ecoserver && yes | ./ecoserver install

#RUN curl -o linuxgsm.sh https://linuxgsm.sh \
#    && chmod +x linuxgsm.sh
    #&& bash linuxgsm.sh ecoserver

CMD ["sh"]
