FROM oven/bun:alpine
# RUN apk add alpine-conf \
#     echo "vi_VN.UTF-8 UTF-8" >> /etc/locale.gen \
#     locale-gen \
#     echo 'export LANG=vi_VN.UTF-8' > /etc/profile.d/locale.sh \
#     echo 'export LC_ALL=vi_VN.UTF-8' >> /etc/profile.d/locale.sh
WORKDIR /home/bun/app
COPY package.json bun.lockb ./
RUN bun install
COPY . .
EXPOSE 5173
CMD ["bun", "run", "dev"]