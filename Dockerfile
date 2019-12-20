FROM php:7.3-fpm-alpine

# Install dev dependencies
RUN apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    curl-dev \
    imagemagick-dev \
    libtool \
    libxml2-dev \
    postgresql-dev

# Install production dependencies
RUN apk add --no-cache \
    bash \
    curl \
    g++ \
    gcc \
    git \
    imagemagick \
    libc-dev \
    libpng-dev \
    make \
    postgresql-libs \
    rsync \
    zlib-dev \
    libzip-dev \
    libpng-dev

# Install PECL and PEAR extensions
RUN pecl install \
    redis \
    imagick

# Install and enable php extensions
RUN docker-php-ext-enable \
    imagick \
    redis

# Configure Zip
RUN docker-php-ext-configure zip --with-libzip

RUN docker-php-ext-install \
    curl \
    exif \
    iconv \
    mbstring \
    pdo \
    pdo_pgsql \
    pcntl \
    tokenizer \
    xml \
    gd \
    zip \
    bcmath

# Install composer
ENV COMPOSER_HOME /composer
ENV PATH ./vendor/bin:/composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

# Cleanup dev dependencies
RUN apk del -f .build-deps

# Setup working directory
WORKDIR /var/www
