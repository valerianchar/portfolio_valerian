#!/bin/bash

set -xe

wait_for_service(){
  until nc -vz $1 $2 > /dev/null; do
    >&2 echo "$3 is unavailable - sleeping"
    sleep 2
  done
  >&2 echo "$2 is up"
}

# Wait MYSQL
wait_for_service "${DB_HOST}" "${DB_PORT}" "Mysql"
#
## Wait Redis
#wait_for_service "${REDIS_HOST}" "${REDIS_PORT}" "Redis"
#
## Wait Minio
#wait_for_service "${MINIO_HOST}" "${MINIO_PORT}" "Minio"

echo "app init started!"
cp -rp /src/. /var/www
echo "app init completed!"

cd /var/www
echo "Laravel provisioning..."

dirs=( "/var/www/storage/app/public" "/var/www/storage/framework/cache" "/var/www/storage/framework/sessions" "/var/www/storage/framework/testing" "/var/www/storage/framework/views" "/var/www/storage/logs" )

for i in "${dirs[@]}"; do
    mkdir -p $i
done

ls -lash

chmod -R 777 /var/www/storage
chown -R 1000:1000 /var/www/storage

sed -i "s~$(grep -e "APP_DEBUG=" .env)~APP_DEBUG=${APP_DEBUG}~g" .env
sed -i "s~$(grep -e "APP_URL=" .env)~APP_URL=${APP_URL}~g" .env

sed -i "s~$(grep -e "ASSET_URL=" .env)~ASSET_URL=${ASSET_URL}~g" .env

sed -i "s~$(grep -e "DB_CONNECTION=" .env)~DB_CONNECTION=${DB_CONNECTION}~g" .env
sed -i "s~$(grep -e "DB_HOST=" .env)~DB_HOST=${DB_HOST}~g" .env
sed -i "s~$(grep -e "DB_PORT=" .env)~DB_PORT=${DB_PORT}~g" .env
sed -i "s~$(grep -e "DB_DATABASE=" .env)~DB_DATABASE=${DB_DATABASE}~g" .env
sed -i "s~$(grep -e "DB_USERNAME=" .env)~DB_USERNAME=${DB_USERNAME}~g" .env
sed -i "s~$(grep -e "DB_PASSWORD=" .env)~DB_PASSWORD=${DB_PASSWORD}~g" .env

php artisan clear-compiled
php artisan view:cache
php artisan route:cache
php artisan config:cache

php artisan migrate --force

#php artisan db:seed --force
