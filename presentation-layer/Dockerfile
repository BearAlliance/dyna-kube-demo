FROM node:14-alpine
WORKDIR /app
COPY package.json .
COPY package-lock.json .

ENV NODE_ENV=production
RUN npm ci

COPY . .

EXPOSE 5000

CMD ["npm", "start"]
