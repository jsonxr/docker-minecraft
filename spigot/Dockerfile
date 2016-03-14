FROM jsonxr/java:latest

MAINTAINER jsonxr <jsonxr@gmail.com>

ENV MINECRAFT_VERSION=1.9

# fast workaround 
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y wget git && \
    apt-get clean all && \
    useradd -s /bin/bash -d /minecraft -m minecraft && \
    mkdir /minecraft-build && \
    cd /minecraft-build && \
    wget https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar && \
    HOME=/minecraft-build java -jar BuildTools.jar --rev $MINECRAFT_VERSION

# expose minecraft port
EXPOSE 25565
WORKDIR /minecraft
VOLUME /minecraft
ENV MEMORY_MIN=512M
ENV MEMORY_MAX=1024M

# Copy start script and defaults
COPY /src/ /

#set default command
CMD ["/start.sh"]
