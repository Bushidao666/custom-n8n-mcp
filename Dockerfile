FROM n8nio/n8n:latest

USER root

# Instala dependências essenciais do Alpine
RUN apk add --no-cache git python3 make gcc g++ \
    && npm install -g typescript

# Clona o repo do MCP do Trello
RUN git clone https://github.com/delorenj/mcp-server-trello.git /opt/mcp-server-trello

# Entra na pasta, instala e builda
WORKDIR /opt/mcp-server-trello
RUN npm install && npm run build

# Linka o pacote como global
RUN npm link

# Instala o node community do MCP Client
RUN npm install -g git+https://github.com/nerding-io/n8n-nodes-mcp.git

USER node
