FROM node:onbuild

MAINTAINER Mikael@murf.se

WORKDIR /usr/src/app/
RUN openssl req -nodes -newkey rsa:2048 -keyout server.key -out server.csr -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com" && openssl x509 -req -days 365 -in server.csr -signkey server.key -out server.crt && openssl x509 -in server.crt -noout -sha256 -fingerprint

ENV APP_KEY=api_hubic_ APP_SECRET= HTTP=false BASE_URL=https://localhost:8080
EXPOSE 8080


