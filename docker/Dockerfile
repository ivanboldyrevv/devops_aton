FROM nginx:stable-alpine

RUN mkdir /etc/nginx/certs

COPY nginx.conf /etc/nginx/nginx.conf
COPY certs/server.crt /etc/nginx/certs/server.crt
COPY certs/server.key /etc/nginx/certs/server.key

RUN mkdir -p /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]