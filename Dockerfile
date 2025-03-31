FROM n8nio/n8n:latest

USER root

RUN npm install -g git+https://github.com/modelcontextprotocol/server-trello.git

USER node
