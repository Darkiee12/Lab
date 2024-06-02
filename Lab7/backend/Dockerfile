FROM oven/bun:alpine
WORKDIR /home/bun/app
COPY package.json bun.lockb ./
RUN bun install
COPY . .
EXPOSE 3000
CMD ["bun", "run", "start"]