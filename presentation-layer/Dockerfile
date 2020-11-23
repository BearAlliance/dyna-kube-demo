FROM node:12

WORKDIR /usr/var

COPY package.json .
COPY package-lock.json .

RUN npm ci

COPY .. .

EXPOSE 3000

CMD ["npm", "start"]