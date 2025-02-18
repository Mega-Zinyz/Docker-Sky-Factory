FROM itzg/minecraft-server:java8

ENV TYPE=FORGE
ENV FORGE_VERSION=14.23.5.2855
ENV VERSION=1.12.2
ENV MEMORY=4G
ENV EULA=TRUE
ENV LEVEL-NAME=Imperium
ENV ONLINE_MODE=FALSE
ENV ENABLE_GUI=false

WORKDIR /data

# Cek apakah SkyFactory sudah terinstal, jika tidak, download dan ekstrak
RUN if [ ! -d "/data/mods" ]; then \
    echo "Downloading SkyFactory 4..." && \
    curl -o /data/skyfactory4.zip -L "https://www.curseforge.com/api/v1/mods/296062/files/3565683/download" && \
    unzip /data/skyfactory4.zip -d /data && \
    rm /data/skyfactory4.zip; \
    fi

CMD ["bash", "/start"]
