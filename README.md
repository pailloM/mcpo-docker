MCP server configured via json config file

Defult config provides memory, time and osm. Config.json can be monted to a local volume and modified as required.

Exemple docker compose:

```
  mcpo:
    container_name: mcpo
    hostname: mcpo
    restart: "unless-stopped"
    image: ghcr.io/paillom/mcpo-docker:main

    environment:
      - "PORT=8000"  

    volumes:
      - "local_path_to_config:/config"

```

Default config.json:
```
{
  "mcpServers": {
    "memory": {
      "command": "npx",
      "args": ["-y", "@modelcontextprotocol/server-memory"]
    },
    "time": {
      "command": "uvx",
      "args": ["mcp-server-time", "--local-timezone=America/Detroit"]
    },
    "fetch": {
      "command": "uvx",
      "args": ["mcp-server-fetch"]
    },
    "osm": {
      "command": "uvx",
      "args": [
        "osm-mcp-server"
      ]
    }
  }
}

```