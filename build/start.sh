#!/bin/bash

php-fpm &

PHP_FPM_PID=$!

nodemon --watch /var/www/html --ext php --exec "php /usr/local/bin/clear-opcache.php; kill -USR2 $PHP_FPM_PID"
