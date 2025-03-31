FROM n8nio/n8n:latest

# Modo root temporário pra instalar dependências globais
USER root

# Instala o MCP do Trello globalmente
RUN npm install -g @modelcontextprotocol/server-trello

# Volta pro usuário seguro
USER node
