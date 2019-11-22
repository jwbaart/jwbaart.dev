FROM alpine AS builder
WORKDIR /usr/src/app
RUN apk add --no-cache --update nodejs nodejs-npm
COPY package.json package-lock.json ./
RUN npm install

FROM alpine
WORKDIR /usr/src/app
RUN apk add --no-cache --update nodejs
COPY --from=builder /usr/src/app/node_modules ./node_modules
COPY . .
EXPOSE 8080
CMD [ "node", "express.js" ]

# docker run -p 8080:8080 jwbaart.dev