FROM ghcr.io/ftbteam/modpack-downloader:latest

# Set environment variables
ENV FTB_MODPACK_ID=56
ENV FTB_MODPACK_VERSION=latest
ENV MEMORY=4G
ENV EULA=TRUE
ENV LEVEL_NAME=Imperium
ENV ONLINE_MODE=FALSE

# Set working directory
WORKDIR /data

# Copy the world files
COPY Imperium/ /data/saves/Imperium/

# Set correct permissions
RUN chmod -R 755 /data && chown -R 1000:1000 /data

# Run the FTB server
CMD ["/start"]
