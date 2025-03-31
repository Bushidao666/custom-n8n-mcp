FROM n8nio/n8n:latest

USER root

# Instala o TypeScript (necessário pro MCP server)
RUN npm install -g typescript

# Instala o MCP do Trello via pacote buildado (substitua pelo link do seu GitHub)
RUN npm install -g https://raw.githubusercontent.com/Bushidao666/mcp-trello-build/main/modelcontextprotocol-server-trello-0.1.0.tgz

# Instala o node community do MCP no N8N (pra aparecer como nó no builder)
RUN npm install -g n8n-nodes-mcp

USER node
