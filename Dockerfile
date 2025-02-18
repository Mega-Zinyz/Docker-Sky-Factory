FROM itzg/minecraft-server:java8

# Install unzip to ensure we can extract zip files
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

# Copy SkyFactory-4.zip and the Imperium world folder to the container
COPY SkyFactory-4.zip /data/SkyFactory-4.zip
COPY Imperium/ /data/Imperium/

# Check for the zip file and extract if it exists
RUN echo "Listing files in /data" && ls /data && \
    if [ -f "/data/SkyFactory-4.zip" ]; then \
        echo "Extracting SkyFactory 4..." && \
        unzip /data/SkyFactory-4.zip -d /data && \
        rm /data/SkyFactory-4.zip; \
    fi && \
    echo "Listing contents of /data after extraction" && ls /data && \
    echo "Listing contents of /data/Imperium" && ls /data/Imperium

# Append the level-name to server.properties to set the world name
RUN echo "level-name=Imperium" >> /data/server.properties

# Check that the permissions are correct
RUN chmod -R 755 /data/Imperium

# Create a start script (if you don't have one already)
RUN echo '#!/bin/bash\njava $JVM_OPTS -Xmx$MEMORY -Xms$MEMORY -jar forge-$FORGE_VERSION.jar nogui' > /data/start && \
    chmod +x /data/start

# Set entrypoint to run the Minecraft server
CMD ["bash", "/data/start"]
