FROM ryshe/terraria:vanilla-1.4.5.5

# Expose the standard Terraria port
EXPOSE 7777

# No custom ENTRYPOINT needed, as we'll pass arguments via command in fly.toml
# The default entrypoint in ryshe/terraria will execute the server with any args provided.
