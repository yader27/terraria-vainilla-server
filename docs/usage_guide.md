# Usage Guide

This document outlines how to run and interact with the tModLoader 1.4 Docker container context that has been set up.

## Pulling the Image
Before initializing your Docker container, you must retrieve the tModLoader image from Dockerhub:

```bash
# To get the latest standard stable update
docker pull jacobsmile/tmodloader1.4:latest

# To get a specific string tagged tModLoader image (e.g. v2022.09.47.13 from GitHub Releases)
docker pull jacobsmile/tmodloader1.4:v2022.09.47.13
```

## Running the Container Directly

When starting the container via Docker CLI directly, specify your persistent storage location and your desired runtime variables explicitly.

```bash
docker run -p 7777:7777 --name tmodloader --rm \
  -v /path/to/data:/data \
  -e TMOD_SHUTDOWN_MESSAGE='Goodbye!' \
  -e TMOD_AUTOSAVE_INTERVAL='15' \
  -e TMOD_AUTODOWNLOAD='2824688072,2824688266' \
  -e TMOD_ENABLEDMODS='2824688072,2824688266' \
  -e TMOD_MOTD='Welcome to my tModLoader Server!' \
  -e TMOD_PASS='secret' \
  -e TMOD_MAXPLAYERS='16' \
  -e TMOD_WORLDNAME='Earth' \
  -e TMOD_WORLDSIZE='2' \
  -e TMOD_WORLDSEED='not the bees!' \
  -e TMOD_DIFFICULTY='3' \
  jacobsmile/tmodloader1.4
```

> **Note**: Map `-v /path/to/data:/data` to a valid directory on your host to persist your worlds and downloaded mod files.

## Running with Docker Compose

If utilizing the `docker-compose.yml` configuration standard provided in the repository, starting the server is simplified:

```bash
# This abstracts away the huge CLI prompt and utilizes default environment values structured in docker-compose.yml
docker compose up --build
```
> Modify the `docker-compose.yml` to set your desired environment variables before starting.

## Interacting With The Console

You can pass command injection strings straight into the tModLoader instance from the Host by invoking the following execution format: 

```bash
docker exec tmodloader inject "say Hello World!"
```

*(You can replace `tmodloader` with the container hex UID if you didn't label the runtime during your `docker run` command).*

## Mod Handling Best Practices

To initialize modifications, you utilize two specific commands: 
1. **Downloading Mods**: Fetch via `TMOD_AUTODOWNLOAD`. 
2. **Enabling Mods**: Tell the server to initialize the packages on start via `TMOD_ENABLEDMODS`. 

**Tip**: Repeated downloading consumes time! Once you verify you have downloaded the packages required to `/data/mods`, you can delete `TMOD_AUTODOWNLOAD` from your runtime flags whilst configuring `TMOD_ENABLEDMODS` independently to save startup time!
