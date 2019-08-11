FROM php:7.3-fpm-alpine

# RUN addgroup -g 3000 -S app
# RUN adduser -u 3000 -S -D -G app app
 
# Override Docker configuration: listen on Unix socket instead of TCP
RUN sed -i "s|listen = 9000|listen = /sock/docker.sock \
\nlisten.mode = 0666|" \
/usr/local/etc/php-fpm.d/zz-docker.conf
# \nlisten.owner = app \
# \nlisten.group = app \

# Use the default production configuration
#RUN cp "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"

# install the PHP extensions we need
RUN apk add --update freetype-dev libpng-dev libjpeg-turbo-dev libxml2-dev autoconf g++ imagemagick-dev libtool make \
    && docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install opcache \
    && docker-php-ext-install soap \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk del autoconf g++ libtool make \
    && rm -rf /tmp/* /var/cache/apk/*

ADD php.ini /usr/local/etc/php/conf.d/php.ini

CMD ["php-fpm"]
