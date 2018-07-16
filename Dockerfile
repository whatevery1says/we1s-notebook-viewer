FROM nginx:1.14.0-alpine
LABEL maintainer="Jeremy Douglass <jeremydouglass@gmail.com>"

COPY nginx.conf /etc/nginx/nginx.conf
COPY nginx.vh.default.conf /etc/nginx/conf.d/default.conf
