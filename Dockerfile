FROM ubuntu:14.04
MAINTAINER galan

ENV KAG_HOME /opt/kag-server
ENV KAG_URL http://dl.kag2d.com/kag-linux32-dedicated-release.tar.gz

RUN apt-get install -y wget && \
    wget ${KAG_URL} -P /opt && \
    mkdir ${KAG_HOME} && \
    tar xzfv /opt/kag-linux32-dedicated-release.tar.gz -C ${KAG_HOME} && \
    rm /opt/kag-linux32-dedicated-release.tar.gz && \
    chmod +x ${KAG_HOME}/dedicatedserver.sh
RUN dpkg --add-architecture i386 && \
    apt-get update && \
    apt-get install -y libc6:i386 libstdc++6:i386 libglapi-mesa:i386 libgl1-mesa-glx:i386 libxxf86vm1:i386 libxext6:i386 libx11-6:i386 libfreetype6:i386 libgcc1-dbg:i386 libxdamage1:i386 libxfixes3:i386 libx11-xcb1:i386 libxcb-glx0:i386 libxcb-dri2-0:i386 libxcb1:i386  libdrm2:i386 libxdmcp6:i386

WORKDIR ${KAG_HOME}

CMD ${KAG_HOME}/dedicatedserver.sh

EXPOSE 50301/udp

