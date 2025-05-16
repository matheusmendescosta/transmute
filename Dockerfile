FROM node:lts-bookworm-slim

WORKDIR /opt/app

COPY package.json package-lock.json ./
RUN rm -rf node_modules && \
    npm i

COPY prisma ./prisma

COPY . .

RUN npx prisma generate

CMD ["npm", "run", "dev"]