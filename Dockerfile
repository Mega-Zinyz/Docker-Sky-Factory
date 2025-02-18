FROM itzg/minecraft-server:java8

ENV TYPE=FORGE
ENV FORGE_VERSION=14.23.5.2855
ENV VERSION=1.12.2
ENV MEMORY=4G
ENV EULA=TRUE
ENV LEVEL-NAME=Imperium
ENV ONLINE_MODE=FALSE
ENV ENABLE_GUI=false
ENV JVM_OPTS="-Dlog4j2.formatMsgNoLookups=true"
    
# Set working directory
WORKDIR /data

# Menyalin file SkyFactory4.zip dari repo ke dalam container
COPY SkyFactory-4.zip /data/SkyFactory-4.zip

# Ekstrak file zip dan hapus file zip setelahnya
RUN if [ ! -d "/data/mods" ]; then \
    echo "Extracting SkyFactory 4..." && \
    unzip /data/skyfactory4.zip -d /data && \
    rm /data/skyfactory4.zip; \
    fi

# Set entrypoint untuk menjalankan server Minecraft
CMD ["bash", "/start"]
