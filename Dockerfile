# Use itzg's Minecraft Server Docker image
FROM itzg/minecraft-server:java17

# Set environment variables
ENV TYPE=FORGE
ENV VERSION=1.20.1
ENV MEMORY=6G
ENV EULA=TRUE
ENV LEVEL=SkyFactory5
ENV ONLINE_MODE=FALSE

# Allow passing the API key securely
ARG CURSEFORGE_API_KEY
ENV CURSEFORGE_API_KEY=${CURSEFORGE_API_KEY}

WORKDIR /data

# ✅ Prevent memory errors while installing packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends jq curl unzip && \
    rm -rf /var/lib/apt/lists/*

# Copy SkyFactory 5 files to the container
COPY SkyFactory5-5.0.7/ /data/

# Debug: Print files inside container (REMOVE after debugging)
RUN ls -l /data/manifest.json || echo "🚨 manifest.json is MISSING!"

# ✅ Ensure manifest.json exists before proceeding
RUN test -f /data/manifest.json || (echo "❌ ERROR: manifest.json not found!" && exit 1)

# Create the mods folder
RUN mkdir -p /data/mods

# Debug: Print API key (REMOVE after debugging)
RUN echo "CurseForge API Key: $CURSEFORGE_API_KEY"

# ✅ Ensure manifest.json exists before running jq
RUN if [ ! -f /data/manifest.json ]; then \
        echo "❌ ERROR: manifest.json not found!"; exit 1; \
    fi

# ✅ Download mods from CurseForge API with retries and file verification
RUN jq -r '.files[] | "\(.projectID) \(.fileID)"' /data/manifest.json > /data/modlist.txt && \
    while read -r projectID fileID; do \
        echo "Fetching mod: Project ID: $projectID, File ID: $fileID"; \
        mod_file="/data/mods/$fileID.jar"; \
        if [ -f "$mod_file" ]; then \
            echo "✅ Mod $fileID.jar already exists, skipping download."; \
        else \
            attempt=0; \
            success=0; \
            while [ $attempt -lt 3 ]; do \
                FILE_URL=$(curl -s -H "x-api-key: ${CURSEFORGE_API_KEY}" -w "%{redirect_url}" -o /dev/null "https://www.curseforge.com/api/v1/mods/$projectID/files/$fileID/download"); \
                if [ "$FILE_URL" != "null" ] && [ "$FILE_URL" != "" ]; then \
                    echo "Downloading from $FILE_URL"; \
                    curl -L -o "$mod_file" "$FILE_URL"; \
                    if [ -f "$mod_file" ]; then \
                        echo "✅ Successfully downloaded $fileID.jar"; \
                        success=1; \
                        break; \
                    else \
                        echo "⚠️ Download failed, retrying... ($attempt/3)"; \
                    fi; \
                else \
                    echo "⚠️ Warning: Could not find download URL for mod $projectID-$fileID"; \
                fi; \
                attempt=$((attempt+1)); \
                sleep 2; \
            done; \
            if [ $success -eq 0 ]; then \
                echo "❌ ERROR: Failed to download mod $projectID-$fileID after 3 attempts."; \
            fi; \
        fi; \
    done < /data/modlist.txt

# Verify each mod was downloaded correctly
RUN while read -r projectID fileID; do \
        MOD_FILE="/data/mods/$fileID.jar"; \
        if [ -f "$MOD_FILE" ]; then \
            echo "✅ Mod $projectID-$fileID downloaded successfully"; \
        else \
            echo "❌ ERROR: Mod $projectID-$fileID is missing!"; \
        fi; \
    done < /data/modlist.txt

RUN FAIL_BUILD=0; while read -r projectID fileID; do \
    MOD_FILE="/data/mods/$fileID.jar"; \
    if [ ! -f "$MOD_FILE" ]; then \
        echo "❌ ERROR: Mod $projectID-$fileID is missing!"; \
        FAIL_BUILD=1; \
    fi; \
done < /data/modlist.txt; \
if [ $FAIL_BUILD -eq 1 ]; then exit 1; fi

# ✅ Only copy StartServer.sh if it exists
RUN if [ -f "/data/StartServer.sh" ]; then \
        echo "✅ StartServer.sh found"; \
    else \
        echo "⚠️ Warning: StartServer.sh not found"; \
    fi

# Ensure correct permissions
RUN chmod -R 755 /data && \
    chown -R 1000:1000 /data

# ✅ Fix: Only change permissions if StartServer.sh exists
RUN if [ -f /data/StartServer.sh ]; then chmod +x /data/StartServer.sh; else echo "⚠️ Warning: StartServer.sh not found"; fi

# Expose ports for Minecraft and RCON
EXPOSE 25565 25575

# Run the SkyFactory start script instead of manually running Forge
CMD ["/bin/bash", "/data/StartServer.sh"]
