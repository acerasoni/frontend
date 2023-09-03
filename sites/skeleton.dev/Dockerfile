# Dockerfile. Source: https://gist.github.com/aradalvand/04b2cad14b00e5ffe8ec96a3afbb34fb

FROM node:20-slim AS builder

WORKDIR /app

COPY package*.json .

RUN npm install -g pnpm
RUN pnpm install
RUN pnpm run build
RUN pnpm prune --production

FROM node:20-slim
WORKDIR /app
COPY --from=builder /app/build build/
COPY --from=builder /app/node_modules node_modules/
COPY ./package.json .
EXPOSE 3000
ENV NODE_ENV=production
CMD [ "node", "build" ]
