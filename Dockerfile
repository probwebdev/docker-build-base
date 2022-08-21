ARG NODE_VER=18-slim

FROM node:$NODE_VER

ARG PNPM_VER=7.9.3

RUN apt-get update && \
    apt-get install gosu git -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN corepack enable && \
    corepack prepare pnpm@$PNPM_VER --activate
