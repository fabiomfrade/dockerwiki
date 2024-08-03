FROM alpine:latest
LABEL maintainer="Fábio Frade - fabiomfrade@gmail.com"
COPY start.sh nginx.conf /opt/
RUN set -x \
    # Instalacao do PHP
    && apk update && apk upgrade && apk add php-fpm nginx php-bz2 php-openssl php-mbstring php-gd php-intl php-xml curl php-zip php-ldap php-ctype php-session \
    # Configuracao adicional
    && sed -i "s|upload_max_filesize = 2M|upload_max_filesize = 200M|g" /etc/php83/php.ini \
    # Baixando a Wiki
    && mkdir -p /var/www/localhost/htdocs/dokuwiki && ln -s /var/www/localhost/htdocs/dokuwiki /dokuwiki && cd /opt/ \
    && curl -s -L  https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz | tar -xzvf - \
    && mv dokuwiki-* dokuwiki && chmod +x start.sh \
    && mv /opt/nginx.conf /etc/nginx/http.d/default.conf 
EXPOSE 80
STOPSIGNAL SIGQUIT
WORKDIR /var/www/localhost/htdocs
VOLUME /dokuwiki
CMD [ "/opt/start.sh" ]