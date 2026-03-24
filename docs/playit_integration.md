# Playit.gg Integration

## Overview
[Playit.gg](https://playit.gg/) is a global tunneling service used to host game servers without needing to tinker with port forwarding or UPNP settings on your router. It behaves somewhat like a VPN proxy, generating a public IP and port that routes directly to your localized backend server securely. This is especially useful for users located behind a Strict NAT or CGNAT.

## Docker Implementation Details
To eliminate the requirement to run another application on the host machine natively, the `playit` official docker image (`ghcr.io/playit-cloud/playit-agent:0.17`) has been integrated into our `docker-compose.yml`. 

* **Service Name**: `playit` (with container name `playit_tunnel`).
* **Networking**: Since it uses `network_mode: host`, it can directly access the local game server running on port 7777.
* **Authentication**: The agent uses an environment variable `SECRET_KEY` to authenticate with your playit.gg account.

## How to Initialize and Claim Your Server
Immediately after bringing the stack online using `docker compose up -d`, the `playit` container will connect using your `SECRET_KEY`.

1. If you don't have a `SECRET_KEY`, you might first need to run the agent in interactive mode to get a claim link:
```bash
docker run --rm -it --net=host ghcr.io/playit-cloud/playit-agent:0.17
```
2. Follow the link provided in the logs to claim the agent and get the key.
3. Once you have the key, update the `SECRET_KEY` variable in the `docker-compose.yml` file.
4. When setting up the tunnel in the Playit.gg dashboard, create a **Tunnel** for `Terraria` (UDP port 7777). 
5. The local address will be `127.0.0.1:7777` as it is using the host network from the container perspective.


## Updating Playit
The `playit:latest` image gets updated frequently by its developers. You can pull the latest patches utilizing standard Docker workflows:
```bash
docker pull playitgg/playit:latest
docker compose up -d
```
