# Imagem base: Node.js 18 no Alpine Linux.
FROM node:18-alpine

# Instala o pacote "curl".
RUN apk --no-cache add curl

# Criação do diretório "/app" e definição de permissões para o usuário "node".
RUN mkdir -p /app && chown -R node:node /app
USER node

# Define o diretório de trabalho para "/app".
WORKDIR /app

# Copia o arquivo package.json e package-lock.json (se existir) para o diretório de trabalho.
COPY --chown=node:node package*.json ./

# Instala as dependências do projeto com o comando "npm install".
RUN npm install

# Copia a pasta "src" para o diretório de trabalho, mantendo as permissões do usuário "node".
COPY --chown=node:node src src
COPY --chown=node:node tsconfig.json .
