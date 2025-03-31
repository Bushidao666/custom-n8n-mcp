FROM n8nio/n8n:latest

USER root

RUN npm install -g typescript
RUN npm install -g https://raw.githubusercontent.com/Bushidao666/mcp-trello-build/main/modelcontextprotocol-server-trello-0.1.0.tgz

USER node
