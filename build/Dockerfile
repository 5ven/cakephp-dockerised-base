FROM php:8.3-fpm

RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    mariadb-client \
    zlib1g-dev \
    libicu-dev \
    g++ \
    unzip \
    libzip-dev \
    zip \
    git \
    curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql intl zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN curl -sL https://deb.nodesource.com/setup_21.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g nodemon

COPY start.sh /usr/local/bin/start.sh
COPY clear-opcache.php /usr/local/bin/clear-opcache.php

RUN chmod +x /usr/local/bin/start.sh /usr/local/bin/clear-opcache.php

WORKDIR /var/www/html

EXPOSE 9000

CMD ["/usr/local/bin/start.sh"]