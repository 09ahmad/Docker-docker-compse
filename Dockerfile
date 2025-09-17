FROM oven/bun:1 AS base

WORKDIR /app

COPY ./package.json ./package.json
COPY ./bun.lock ./bun.lock

RUN bun install 

COPY  . .

RUN bunx prisma generate

EXPOSE 3000

CMD [ "bun", "dev:docker" ] 