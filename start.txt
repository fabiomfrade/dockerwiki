#!/bin/sh

# Verify if mounted volume data is empty; Case true, copy necessary files else nothing.

if [ -z "$(ls -A /dokuwiki)" ]
then
    cp -rap /opt/.dokuwiki/* /dokuwiki
    /bin/sh -c /usr/sbin/php-fpm7 && nginx -g 'daemon off;'
else
    echo "Iniciando Nginx"
    /bin/sh -c /usr/sbin/php-fpm7 && nginx -g 'daemon off;'
fi