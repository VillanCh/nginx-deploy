FROM nginx:alpine

# default.conf.template
COPY default.conf.template /etc/nginx/conf.d/default.conf.template

# config index.html for default welcome page
COPY index.html /var/www/html/index.html
ENV DOLLAR='$'

# config env, overide can change config
ENV SERVER_NAME=localhost
ENV REVERSE_PROXY_HOST=127.0.0.1
ENV REVERSE_PROXY_PORT=8080

CMD /bin/sh -c "envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && cat /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'"