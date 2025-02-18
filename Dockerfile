FROM itzg/minecraft-server:java8

# Install unzip untuk memastikan kita bisa ekstrak file zip jika perlu
RUN apt-get update && apt-get install -y unzip

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

# Menyalin file SkyFactory-4.zip dan world Imperium yang sudah diekstrak ke dalam container
COPY SkyFactory-4.zip /data/SkyFactory-4.zip
COPY Imperium/ /data/Imperium/

# Periksa apakah file ada dan ekstrak jika ada
RUN echo "Listing files in /data" && ls /data && \
    if [ -f "/data/SkyFactory-4.zip" ]; then \
        echo "Extracting SkyFactory 4..." && \
        unzip /data/SkyFactory-4.zip -d /data && \
        rm /data/SkyFactory-4.zip; \
    fi && \
    echo "Listing contents of /data after extraction" && ls /data

# Pastikan server.properties memiliki LEVEL-NAME yang sesuai
RUN echo "level-name=Imperium" > /data/server.properties

# Set entrypoint untuk menjalankan server Minecraft
CMD ["bash", "/start"]
