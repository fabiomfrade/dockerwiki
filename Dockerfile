FROM alpine:3.15
LABEL maintainer="Fábio Frade - fabiomfrade@gmail.com"
COPY nginx.conf start.txt /opt/
RUN set -x \
    # Instalando Pacotes
    && apk update && apk upgrade && apk --no-cache add nginx=1.20.2-r1 curl php7 php7-cli php7-ctype php7-curl php7-fpm php7-gd php7-json php7-ldap php7-mbstring php7-openssl php7-pdo php7-pecl-imagick php7-session php7-simplexml php7-xml php7-zip php7-zlib \
    # Configurando usuario NGINX
    && mv /opt/nginx.conf /etc/nginx/http.d/default.conf && mv /opt/start.txt /start.sh && chmod +x /start.sh \
    && sed -i "s/user\ nginx\;/user\ nobody\;/g" /etc/nginx/nginx.conf \
    && sed -i "s|upload_max_filesize = 2M|upload_max_filesize = 200M|g" /etc/php7/php.ini \
    # Baixando Dokuwiki
    && mkdir -p /var/www/localhost/htdocs/ && cd /opt/ \
    && wget https://download.dokuwiki.org/src/dokuwiki/dokuwiki-stable.tgz && tar zxvf dokuwiki-stable.tgz && rm -rf dokuwiki-stable.tgz \
    && mv dokuwiki-* .dokuwiki && chown -R nobody:nobody .dokuwiki && chmod -R 700 .dokuwiki/ \
    # Instalando a Dokuwiki
    && mkdir /dokuwiki && ln -s /dokuwiki /var/www/localhost/htdocs/dokuwiki
EXPOSE 80
STOPSIGNAL SIGQUIT
WORKDIR /var/www/localhost/htdocs/dokuwiki/
VOLUME /dokuwiki
#CMD ["/bin/sh", "-c", "/usr/sbin/php-fpm7 && nginx -g 'daemon off;'"]
CMD ["/bin/sh", "-x", "/start.sh"]