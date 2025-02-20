# Use itzg's Minecraft Server Docker image
FROM itzg/minecraft-server:java8

# Set environment variables
ENV TYPE=FORGE
ENV VERSION=1.12.2
ENV MEMORY=4G
ENV EULA=TRUE
ENV LEVEL=Imperium
ENV ONLINE_MODE=FALSE

# Allow passing the API key securely
ARG CURSEFORGE_API_KEY
ENV CURSEFORGE_API_KEY=${CURSEFORGE_API_KEY}

WORKDIR /data

# ✅ Prevent memory errors while installing packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends jq curl unzip && \
    rm -rf /var/lib/apt/lists/*

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

# ✅ Download mods from CurseForge API (using an environment variable)
RUN jq -r '.files[] | "\(.projectID) \(.fileID)"' /data/SkyFactory-4-4.2.4/manifest.json > /data/modlist.txt && \
    while read -r projectID fileID; do \
        echo "Fetching mod: Project ID: $projectID, File ID: $fileID"; \
        FILE_URL=$(curl -s "https://api.curseforge.com/v1/mods/$projectID/files/$fileID/download-url" -H "x-api-key: $CURSEFORGE_API_KEY" | jq -r '.data'); \
        if [ "$FILE_URL" != "null" ]; then \
            curl -L -o "/data/mods/$fileID.jar" "$FILE_URL"; \
        else \
            echo "⚠️ Warning: Could not download mod $projectID-$fileID"; \
        fi; \
    done < /data/modlist.txt

# Copy the saved world (if you already have one)
COPY Imperium/ /data/saves/Imperium/

# ✅ Only copy StartServer.sh if it exists
RUN if [ -f "SkyFactory-4-4.2.4/StartServer.sh" ]; then cp SkyFactory-4-4.2.4/StartServer.sh /data/StartServer.sh; else echo "Warning: StartServer.sh not found"; fi

# Ensure correct permissions
RUN chmod -R 755 /data && \
    chown -R 1000:1000 /data

# ✅ Fix: Only change permissions if StartServer.sh exists
RUN [ -f /data/StartServer.sh ] && chmod +x /data/StartServer.sh || echo "Warning: StartServer.sh not found"

# Expose ports for Minecraft and RCON
EXPOSE 25565 25575

# Run the SkyFactory 4 start script instead of manually running Forge
CMD ["/bin/bash", "/data/StartServer.sh"]
