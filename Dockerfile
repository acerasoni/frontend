# Dockerfile. Source: https://gist.github.com/aradalvand/04b2cad14b00e5ffe8ec96a3afbb34fb

FROM node:18-alpine AS builder

WORKDIR /app

COPY package*.json .

RUN npm ci
COPY frontend .
RUN npm run build
RUN npm prune --production

FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app/build build/
COPY --from=builder /app/node_modules node_modules/
COPY frontend/package.json .
EXPOSE 3000
ENV NODE_ENV=production
CMD [ "node", "build" ]