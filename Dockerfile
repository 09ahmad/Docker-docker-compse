FROM oven/bun:1 AS base

WORKDIR /app

COPY ./package.json ./package.json
COPY ./bun.lock ./bun.lock

RUN bun install 

COPY  . .

ENV  DATABASE_URL=postgresql://postgres:mysecretpassword@localhost:5432/postgres
RUN echo $DATABASE_URL 

RUN DATABASE_URL=$DATABASE_URL bunx prisma migrate dev
RUN bunx prisma generate

EXPOSE 3000

CMD [ "bun", "start" ] 