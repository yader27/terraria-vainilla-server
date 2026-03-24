# tModLoader 1.4 Docker Implementation

## Overview
This project is a Docker implementation designed for easy configuration and setup of a modded Terraria server powered by tModLoader (Version 1.4). It automates the process of pulling the required server files and managing dependencies via Docker.

## Key Features
- **Workshop Integration**: Easy downloading of tModLoader mods by Workshop ID directly from Steam.
- **Save Management**: Automated and scheduled world saving.
- **Graceful Shutdowns**: Safely shuts down the server upon stopping the container, ensuring that progress is saved.
- **Environment Driven**: Configuration files are optional; almost all settings can be configured using environment variables.
- **Auto-Updates**: Features GitHub workflows to keep the Docker image updated with tModLoader's release cycle.
- **Command Injection**: Ability to send commands to the internal tModLoader server console from the host machine (e.g., using `docker exec tmodloader inject "say Hello!"`).

## Technical Stack
- **Base Image**: Uses Ubuntu via `steamcmd/steamcmd:ubuntu-22` to resolve i386 libraries required by SteamCMD.
- **Game Engine Components**: Downloads `tModLoader` zip releases directly from GitHub during the build.
- **Dependency Management**: Custom `DotNetInstall.sh` to install .NET prerequisites necessary for tModLoader 1.4.

## Persistent Data Structure
To ensure world and mod information persists between container restarts, the `/data` directory inside the container should be mapped to the host system.

Directory Structure:
```text
/data/
├─ steamMods/
│  ├─ steamapps/
│  │  ├─ workshop/
│  │  │  ├─ content/
│  │  │  │  ├─ 1281930/ (tModLoader App ID)
├─ tModLoader/
│  ├─ ModConfigs/
│  ├─ Mods/
│  │  ├─ enabled.json
│  ├─ Worlds/
```

- **steamMods**: Stores raw Steam Workshop content downloads.
- **tModLoader**: Houses server configuration, individual Mod environments, `enabled.json` to process the enabled mods, and World files.
