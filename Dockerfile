# FROM aarch64/node:4.6-slim
ARG NODE_VERSION=8
FROM  arm64v8/node:${NODE_VERSION}-alpine

WORKDIR /app
COPY . /app

RUN rm -f package-lock.json \
    ; rm -rf .idea \
    ; rm -rf node_modules \
    ; npm config set registry "https://registry.npm.taobao.org/" \
    && npm install

EXPOSE 3000
CMD ["node", "app.js"]
