FROM itzg/minecraft-server:java8

# Set environment variables
ENV TYPE=FORGE
ENV VERSION=1.12.2
ENV MEMORY=4G
ENV EULA=TRUE
ENV LEVEL=Imperium
ENV ONLINE_MODE=FALSE

WORKDIR /data

# Copy modpack and world save
COPY SkyFactory-4-4.2.4/ /data/
COPY Imperium/ /data/world/

# Ensure correct permissions
RUN chmod -R 755 /data && \
    chown -R 1000:1000 /data

# Explicitly set the level-name
RUN echo "level-name=Imperium" > /data/server.properties

# Start the server
CMD ["bash", "/data/StartServer.sh"]
