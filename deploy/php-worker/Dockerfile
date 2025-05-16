ARG LARADOCK_PHP_WORKER

FROM $LARADOCK_PHP_WORKER

RUN ls -al

COPY ./deploy/php-worker/supervisord.d /etc/supervisord.d
