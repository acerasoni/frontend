# Source: https://gist.github.com/aradalvand/04b2cad14b00e5ffe8ec96a3afbb34fb

ARG node_version=20-slim

FROM node:${node_version} AS builder
WORKDIR /app
COPY package*.json .
RUN npm ci
COPY . .
RUN npm run build
RUN npm prune --production

FROM node:${node_version}
WORKDIR /app
COPY --from=builder /app/build build/
COPY --from=builder /app/node_modules node_modules/
COPY package.json .
EXPOSE 3000
ENV NODE_ENV=production
CMD [ "node", "build" ]