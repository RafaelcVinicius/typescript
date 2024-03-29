FROM node:17 as build

RUN yarn global add @vue/cli

FROM nginx

COPY ./nginx.conf /etc/nginx/nginx.conf

COPY --from=build ./var/www/dist /usr/share/nginx/html