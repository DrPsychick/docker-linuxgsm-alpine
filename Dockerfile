#FROM joshhsoj1902/linuxgsm-docker
FROM gameservermanagers/linuxgsm-docker

# install mono
USER root
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y apt-transport-https
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo 'deb https://download.mono-project.com/repo/ubuntu stable-xenial main' | tee /etc/apt/sources.list.d/mono-official-stable.list \
    && apt-get update \
    && apt-get install -y jq mono-complete referenceassemblies-pcl ca-certificates-mono mono-xsp4

RUN apt-get install -y mailutils postfix curl wget file bzip2 gzip unzip bsdmainutils python util-linux ca-certificates binutils bc jq tmux lib32gcc1 libstdc++6 libstdc++6:i386 mono-complete

# Cleanup 
RUN apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*


#RUN adduser --disabled-password --gecos "" ecoserver && 
RUN usermod -m -l ecoserver -d /home/ecoserver lgsm && chown -R ecoserver /home/ecoserver

# install ecoserver
USER ecoserver 
RUN cd /home/ecoserver \
    && ./linuxgsm.sh ecoserver \
    && ./ecoserver ul \
    && ./ecoserver fu \
    && ./ecoserver auto-install

EXPOSE 3000/udp 3001/tcp


