FROM itzg/minecraft-server:java8

# Set environment variables
ENV TYPE=FORGE
ENV VERSION=1.12.2
ENV MEMORY=4G
ENV EULA=TRUE
ENV LEVEL-NAME=Imperium
ENV ONLINE_MODE=FALSE

WORKDIR /data

# Copy the extracted SkyFactory 4 modpack into the container
COPY SkyFactory-4-4.2.4/ /data/

# Move the world save into the correct directory
COPY Imperium/ /data/saves/Imperium/

# Ensure correct permissions
RUN chmod -R 755 /data && \
    chown -R 1000:1000 /data

# Make sure server.properties has the correct level name
RUN echo "level-name=Imperium" > /data/server.properties

# Start the server
CMD ["bash", "/data/StartServer.sh"]
