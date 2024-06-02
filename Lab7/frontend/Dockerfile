FROM oven/bun:alpine
WORKDIR /home/bun/app
COPY package.json bun.lockb ./
RUN bun install
COPY . .
EXPOSE 5173
CMD ["bun", "start", "dev"]