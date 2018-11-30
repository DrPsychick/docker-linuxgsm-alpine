FROM frolvlad/alpine-glibc

RUN apk add --no-cache curl jq gzip tmux git

# switch to user steam
RUN adduser -D -s /bin/bash steam
USER steam

#RUN git clone "https://github.com/GameServerManagers/LinuxGSM.git" /home/steam/linuxgsm
#RUN git clone "https://github.com/GameServerManagers/Game-Server-Configs.git" /home/steam/linuxgsm-configs

#RUN curl -o linuxgsm.sh https://linuxgsm.sh \
#    && chmod +x linuxgsm.sh
    #&& bash linuxgsm.sh ecoserver

CMD ["bash"]
