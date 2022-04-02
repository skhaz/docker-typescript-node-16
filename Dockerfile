FROM node:16-alpine AS base

FROM base AS build
WORKDIR /opt
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM base AS dependencies
WORKDIR /opt
COPY package*.json ./
RUN npm install --only=production

FROM gcr.io/distroless/nodejs:16
WORKDIR /app
COPY --from=build /opt/dist .
COPY --from=dependencies /opt/node_modules node_modules

ARG PORT=3000
ENV PORT $PORT
EXPOSE $PORT

CMD ["index.js"]