ARG NODE_VER=18-slim

FROM node:$NODE_VER

LABEL org.opencontainers.image.authors = "https://github.com/probwebdev"
LABEL org.opencontainers.image.source = "https://github.com/probwebdev/docker-build-base"

ARG PNPM_VER=8.6.12

RUN apt-get update && \
    apt-get install gosu git -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN corepack enable && \
    corepack prepare pnpm@$PNPM_VER --activate
