FROM n8nio/n8n:latest

USER root

# Instala ferramentas e typescript
RUN apk add --no-cache \
    git \
    python3 \
    make \
    gcc \
    g++ \
  && npm install -g typescript

# Clona o repositório
RUN git clone https://github.com/delorenj/mcp-server-trello.git /opt/mcp-server-trello

WORKDIR /opt/mcp-server-trello

# Instala dependências + patcha o que falta pro build funcionar
RUN npm install \
  && npm install --save-dev @types/node \
  && npm install --save @modelcontextprotocol/sdk axios \
  && npm run build

# Linka o MCP como global (pra funcionar com npx)
RUN npm link

# Instala o node community do MCP Client
RUN npm install -g git+https://github.com/nerding-io/n8n-nodes-mcp.git

# Remove lixo de build
RUN apk del make gcc g++ python3

USER node
