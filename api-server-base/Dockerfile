FROM nginx:alpine

# default.conf.template
COPY default.conf.template /etc/nginx/conf.d/default.conf.template

# config index.html for default welcome page
COPY index.html /var/www/html/index.html

# run.sh is entrypoint for api-server-base
COPY run.sh /run.sh

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

CMD /run.sh