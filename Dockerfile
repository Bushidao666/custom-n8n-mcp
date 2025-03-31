FROM n8nio/n8n:latest

USER root

# Instala o compilador TypeScript (tsc)
RUN npm install -g typescript

# Instala o MCP do Trello diretamente do GitHub
RUN npm install -g git+https://github.com/delorenj/mcp-server-trello.git

USER node
