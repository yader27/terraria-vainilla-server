FROM ryshe/terraria:vanilla-1.4.5.5

# Expose the standard Terraria port
EXPOSE 7777

# The entrypoint for the Vanilla server
# It will use the configuration provided by environment variables in fly.toml or docker-compose
ENTRYPOINT ["/terraria-server/TerrariaServer.bin.x86_64", "-server"]
