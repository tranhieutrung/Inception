FROM alpine:3.22.0

RUN apk update && apk add \
	bash \
	curl \
	mariadb-client \
	php83 \
	php83-fpm \
	php83-mysqli \
	php83-json \
	php83-curl \
	php83-dom \
	php83-mbstring \
	php83-openssl \
	php83-xml \
	php83-phar \
	php83-session

RUN if ! getent group www-data; then addgroup -S www-data; fi && \
    if ! getent passwd www-data; then adduser -S -G www-data www-data; fi && \
	mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

WORKDIR /var/www/html

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar

COPY conf/www.conf /etc/php83/php-fpm.d/
COPY tools/entrypoint.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/entrypoint.sh

RUN echo "memory_limit = 512M" >> /etc/php83/php.ini
	
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
