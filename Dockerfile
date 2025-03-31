FROM n8nio/n8n:latest

USER root

# Instala TypeScript (necessário pro MCP do Trello)
RUN npm install -g typescript

# Instala MCP do Trello a partir do .tgz hospedado no GitHub (substitua o link se mudar de repo)
RUN npm install -g https://raw.githubusercontent.com/Bushidao666/mcp-trello-build/main/modelcontextprotocol-server-trello-0.1.0.tgz

USER node
