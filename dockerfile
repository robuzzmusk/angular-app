#stage1: build angular application
FROM node:18 AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

#stage2: serve angular application with nginx
FROM nginx:alpine
COPY --from=build /app/dist/angular-app/ /usr/share/nginx/html/
