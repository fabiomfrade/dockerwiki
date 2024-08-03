#!/bin/sh

# Verify if mounted volume data is empty; Case true, copy necessary files else nothing.

if [ -z "$(ls -A /dokuwiki)" ]
then
    cp -rap /opt/dokuwiki/* /dokuwiki
    chown -R nobody:nobody /var/www/localhost/htdocs/dokuwiki
    /usr/sbin/php-fpm83 && nginx -g 'daemon off;'
else
    echo "Iniciando Nginx"
    chown -R nobody:nobody /var/www/localhost/htdocs/dokuwiki
    /usr/sbin/php-fpm83 && nginx -g 'daemon off;'
fi