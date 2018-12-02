#FROM joshhsoj1902/linuxgsm-docker
FROM gameservermanagers/linuxgsm-docker

# install mono
USER root
RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y apt-transport-https
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo 'deb https://download.mono-project.com/repo/ubuntu stable-xenial main' | tee /etc/apt/sources.list.d/mono-official-stable.list \
    && apt-get update \
    && apt-get install -y mono-complete referenceassemblies-pcl ca-certificates-mono mono-xsp4

# Cleanup 
RUN apt-get -y autoremove && \
    apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* && \
    rm -rf /var/tmp/*


RUN usermod -m -l ecoserver -d /home/ecoserver steam && chown -R ecoserver:ecoserver /home/ecoserver

# install ecoserver
USER steam
RUN cd /home/steam \
    && ./linuxgsm.sh ecoserver \
    && ./ecoserver ul \
    && ./ecoserver fu \
    && ./ecoserver auto-install

EXPOSE 3000/udp 3001/tcp


