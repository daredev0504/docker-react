FROM node:alpine as build
WORKDIR /usr/app
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=build /usr/app/build /usr/share/nginx/html