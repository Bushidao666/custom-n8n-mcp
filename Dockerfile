FROM n8nio/n8n:latest

USER root

RUN npm install -g @modelcontextprotocol/mcp-server-trello

USER node
