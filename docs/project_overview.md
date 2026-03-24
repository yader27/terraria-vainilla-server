# Terraria Vanilla Server Implementation

## Overview
This project is a Docker implementation designed for a stable and efficient Terraria Vanilla server (Version 1.4.5.5). It is optimized for deployment on Fly.io using Docker containers.

## Key Features
- **Vanilla Stability**: Runs the official vanilla Terraria server without the overhead of tModLoader.
- **Fly.io Integration**: Native support for Fly.io deployment with `fly.toml` and persistent volume mounts.
- **Environment Driven**: Settings such as world name, seed, difficulty, and password are configured through environment variables.
- **Persistence**: Automated world saving and storage using Fly.io Volumes.

## Technical Stack
- **Base Image**: Uses `ryshe/terraria:vanilla-1.4.5.5`.
- **Infrastructure**: Deployed on Fly.io (shared-cpu-1x, 1024MB RAM).

## Persistent Data Structure
To ensure world and configuration data persists, the `/root/.local/share/Terraria/Worlds` directory is mapped to a Fly.io volume (`terraria_data`).

Directory Structure (Container):
```text
/root/.local/share/Terraria/Worlds/
├─ Puerto.wld
├─ Puerto.wld.bak
├─ config.json
```

- **Worlds**: Houses all `.wld` files and server configuration.
- **Volume**: Managed via `flyctl volumes` for persistent storage.

---
*Para instrucciones detalladas de despliegue, ver [guia_despliegue_vanilla.md](guia_despliegue_vanilla.md).*
