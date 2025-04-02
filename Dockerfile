# Usar a imagem oficial do N8N como base
FROM n8nio/n8n:latest

# Mudar para o usuário root para instalar pacotes
USER root

# Instalar o git (necessário para clonar o repositório)
RUN apt-get update && apt-get install -y git

# Clonar o repositório do MCP Server
RUN git clone https://github.com/delorenj/mcp-server-trello.git /app/mcp-server-trello

# Mudar para o diretório do MCP Server e instalar suas dependências
WORKDIR /app/mcp-server-trello
RUN npm install

# Voltar para o diretório padrão do N8N
WORKDIR /home/node

# Definir o comando padrão para iniciar o N8N
CMD ["n8n", "start"]

# Mudar de volta para o usuário node
USER node
