FROM itzg/minecraft-server:java8

# Install unzip (not needed if files are pre-extracted, but kept for safety)
RUN apt-get update && apt-get install -y unzip

# Minecraft server settings
ENV TYPE=FORGE
ENV FORGE_VERSION=LATEST
ENV VERSION=1.12.2
ENV MEMORY=4G
ENV EULA=TRUE
ENV LEVEL-NAME=Imperium
ENV ONLINE_MODE=FALSE
ENV ENABLE_GUI=false
ENV JVM_OPTS="-Dlog4j2.formatMsgNoLookups=true"

# Set working directory
WORKDIR /data

# Copy pre-extracted SkyFactory 4 modpack files
COPY SkyFactory-4/ /data/

# Copy the Imperium world folder
COPY Imperium/ /data/Imperium/

# Ensure server.properties exists and is writable
RUN touch /data/server.properties && chmod 777 /data/server.properties
RUN sed -i '/level-name=/c\level-name=Imperium' /data/server.properties || echo "level-name=Imperium" >> /data/server.properties

# Set proper permissions for files
RUN chmod -R 755 /data && chown -R 1000:1000 /data

# Start the Minecraft server dynamically
CMD ["sh", "-c", "java $JVM_OPTS -Xmx$MEMORY -Xms$MEMORY -jar $(ls /data/forge-*.jar) nogui"]
