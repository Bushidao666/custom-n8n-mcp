FROM n8nio/n8n:latest

USER root

# Instala git (pra clonar o repositório do MCP)
RUN apk add --no-cache git

# Instala TypeScript globalmente
RUN npm install -g typescript

# Clona o MCP server Trello
RUN git clone https://github.com/delorenj/mcp-server-trello.git /opt/mcp-server-trello

# Instala dependências e builda o MCP
RUN cd /opt/mcp-server-trello && npm install && npm run build

# Linka o pacote como global (pra rodar com npx)
RUN cd /opt/mcp-server-trello && npm link

# Instala o node community do mcpClient
RUN npm install -g git+https://github.com/nerding-io/n8n-nodes-mcp.git

USER node
