FROM itzg/minecraft-server:java8

# Set environment variables
ENV TYPE=FORGE
ENV VERSION=1.12.2
ENV MEMORY=4G
ENV EULA=TRUE
ENV LEVEL-NAME=Imperium
ENV ONLINE_MODE=FALSE

WORKDIR /data

# Copy the extracted SkyFactory 4 files into the container
COPY SkyFactory-4-4.2.4/ /data/

# Move the world save into the correct location
COPY Imperium/ /data/saves/Imperium/

# Ensure the start script and world folder have the correct permissions
RUN chmod +x /data/StartServer.sh && \
    chmod -R 755 /data && \
    chown -R 1000:1000 /data

# Set the entrypoint to run the modpack’s startup script
CMD ["bash", "/data/StartServer.sh"]
