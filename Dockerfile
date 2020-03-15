FROM php:7.4-apache
 RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && apt-get update \
    && apt-get install -y \
        librabbitmq-dev \
        libssh-dev \
        libldap2-dev \
        libxml2-dev \
        libxslt1-dev \
        python-dev \
        git \
        libzip-dev \
        zip \
        libpq-dev \
        unzip \
    && pecl install \
     amqp \
     redis \
    && docker-php-ext-enable \
     amqp \
     redis \
    && apt-get install --reinstall libpng-dev -y \
    && docker-php-ext-install \
     pdo \
     pdo_pgsql \
     xsl \
     gd \
     zip \ 
     intl \
    && a2enmod rewrite headers
    COPY . /var/www/html

    WORKDIR /var/www/html/guestbook

    RUN composer install