FROM node:12.0-slim as builder

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

COPY package*.json ./
RUN npm install

FROM node:12.0-slim

WORKDIR /usr/src/app
COPY --from=builder node_modules node_modules

COPY . .

RUN npm run build

CMD [ "npm", "start" ]