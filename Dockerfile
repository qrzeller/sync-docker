FROM php:7.0-apache
ADD https://download.nextcloud.com/server/releases/nextcloud-12.0.4.zip /tmp/nextcloud.zip
RUN apt-get update
RUN apt-get install unzip -y
RUN unzip -a /tmp/nextcloud.zip -d /var/www/html/ && rm -f /tmp/nextcloud.zip
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install zip
RUN docker-php-ext-install gd 
RUN chown -R www-data:www-data /var/www/html
RUN mv /var/www/html/nextcloud/* /var/www/html/
