# Use itzg's Minecraft Server Docker image
FROM itzg/minecraft-server:java8

# Set working directory
WORKDIR /data

# Install jq to parse manifest.json
RUN apt-get update && apt-get install -y jq curl

# Copy SkyFactory 4 files to the container
COPY SkyFactory-4-4.2.4/ /data/

# Copy overrides (configs, scripts, resources)
COPY SkyFactory-4-4.2.4/overrides/config/ /data/config/
COPY SkyFactory-4-4.2.4/overrides/scripts/ /data/scripts/
COPY SkyFactory-4-4.2.4/overrides/resources/ /data/resources/
COPY SkyFactory-4-4.2.4/overrides/fontfiles/ /data/fontfiles/
COPY SkyFactory-4-4.2.4/overrides/oresources/ /data/oresources/

# Create the mods folder
RUN mkdir -p /data/mods

# Download mods based on manifest.json
RUN cat /data/SkyFactory-4-4.2.4/manifest.json | \
    jq -r '.files[] | "\(.projectID)-\(.fileID)"' > /data/modlist.txt && \
    while IFS=- read -r projectID fileID; do \
        echo "Downloading mod: $projectID-$fileID"; \
        curl -o "/data/mods/$fileID.jar" "https://media.forgecdn.net/files/${fileID:0:4}/${fileID:4}/mod.jar"; \
    done < /data/modlist.txt

# Copy the saved world (if you already have one)
COPY Imperium/ /data/saves/Imperium/

# Ensure correct permissions
RUN chmod -R 755 /data && \
    chown -R 1000:1000 /data

# Expose ports for Minecraft and RCON
EXPOSE 25565 25575

# Ensure StartServer.sh is executable
RUN chmod +x /data/StartServer.sh

# Run the SkyFactory 4 start script instead of manually running Forge
CMD ["/bin/bash", "/data/StartServer.sh"]
