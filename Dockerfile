FROM docker.io/php:8.1-apache-bullseye
RUN apt update && apt install wget unzip
WORKDIR /var/www/html
VOLUME /var/www/html/data
RUN wget -O rainloop.zip https://github.com/RainLoop/rainloop-webmail/releases/download/v1.17.0/rainloop-legacy-1.17.0.zip
RUN unzip rainloop.zip && rm rainloop.zip
RUN echo "Require all denied" > /var/www/html/data/.htaccess
RUN chown -R www-data:www-data /var/www/html && chmod -R 640 /var/www/html/data
