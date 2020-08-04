### STAGE 1: Build ###
FROM node:8.9-alpine AS build
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN npm install
RUN npm run build
### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=build /usr/src/app/dist/crud /usr/share/nginx/html