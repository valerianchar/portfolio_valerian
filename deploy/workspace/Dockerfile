ARG LARADOCK_WORKSPACE

FROM $LARADOCK_WORKSPACE AS builder

WORKDIR /src

# Prepare composer
COPY ./app/composer.json ./app/composer.lock /src/

# set requirement privileges and install packages
RUN sed -i 's~"@php artisan package:discover~"echo prevent @php artisan package:discover~g' /src/composer.json && \
  composer config process-timeout 2000 && \
	composer check-platform-reqs && \
	composer install --no-interaction --no-dev --optimize-autoloader && \
	rm -rf /root/.cache/composer

COPY ./app /src

# set requirement privileges and build front
RUN chown -R 1000:1000 storage && \
	chown -R 1000:1000 bootstrap/cache && \
	chmod -R ug+rwx    bootstrap/cache && \
	chgrp -R 1000      bootstrap/cache && \
	chmod +x artisan && \
	cp .env.example .env && \
	php artisan view:clear && \
	php artisan package:discover --ansi && \
    npm ci && \
	npm run build && \
	npm cache clean --force && \
	rm -rf node_modules

# ---------------

FROM php:8.3-zts-alpine3.17

RUN mkdir -p /var/www \
  && apk add --no-cache netcat-openbsd bash \
  && docker-php-ext-install mysqli pdo pdo_mysql \
  && docker-php-ext-enable pdo_mysql


COPY ./deploy/workspace/provision.sh /provision.sh

RUN chmod +x /provision.sh

COPY --from=builder /src /src

WORKDIR /var/www

CMD [ "sh", "-c", "/provision.sh" ]
