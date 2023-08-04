FROM node:18-alpine

RUN apk --no-cache add curl

RUN mkdir -p /app && chown -R node:node /app
USER node

WORKDIR /app

COPY --chown=node:node package*.json ./

RUN npm install

COPY --chown=node:node src src
COPY --chown=node:node tsconfig.json .
