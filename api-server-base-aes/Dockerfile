FROM openresty/openresty:alpine

RUN apk add --no-cache gettext


# default.conf.template
COPY default.conf.template /etc/nginx/conf.d/default.conf.template

# config index.html for default welcome page
COPY index.html /var/www/html/index.html

# run.sh is entrypoint for api-server-base
COPY run.sh /run.sh

# Copy the Lua script for AES encryption
COPY aes_encrypt.lua /usr/local/openresty/nginx/lua/aes_encrypt.lua

# config env, overide can change config
ENV SERVER_NAME=localhost
ENV REVERSE_PROXY_HOST=127.0.0.1
ENV REVERSE_PROXY_PORT=8080

# basic config for nginx
ENV LISTEN_HTTP_PORT=80
ENV LISTEN_HTTPS_PORT=443

# https config
ENV DISABLE_HTTPS=true
ENV SSL_CERTIFICATE_PATH=/etc/ssl/crt.pem
ENV SSL_CERTIFICATE_KEY_PATH=/etc/ssl/key.pem

# Set AES environment variables
ENV AES_KEY=76d8749b07b4ce66
ENV AES_IV=fedcba9876543210

CMD ["/bin/sh", "/run.sh"]