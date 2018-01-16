FROM php:7.0-apache
ADD https://download.nextcloud.com/server/releases/nextcloud-12.0.4.zip /tmp/nextcloud.zip
RUN apt-get update
RUN apt-get install unzip -y
RUN unzip -a /tmp/nextcloud.zip -d /var/www/html/ && rm -f /tmp/nextcloud.zip
