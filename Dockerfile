FROM n8nio/n8n:latest

USER root

# Instala dependências necessárias pra build do MCP
RUN apt-get update && apt-get install -y git

# Instala TypeScript
RUN npm install -g typescript

# Clona o MCP direto do GitHub
RUN git clone https://github.com/delorenj/mcp-server-trello.git /opt/mcp-server-trello

# Entra na pasta, instala dependências e builda o projeto
RUN cd /opt/mcp-server-trello && npm install && npm run build

# Linka como pacote global pro npx conseguir rodar
RUN cd /opt/mcp-server-trello && npm link

# Instala o community node n8n-nodes-mcp
RUN npm install -g git+https://github.com/nerding-io/n8n-nodes-mcp.git

USER node
