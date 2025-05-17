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

# Créer .env si pas présent
[ ! -f .env ] && cp .env.example .env

echo "🔧 Synchronisation des variables d'environnement avec .env"

# Liste des variables à synchroniser
VARS=(
  APP_NAME
  APP_ENV
  APP_KEY
  APP_DEBUG
  APP_URL
  ASSET_URL
  APP_DOMAIN
  DB_CONNECTION
  DB_HOST
  DB_PORT
  DB_DATABASE
  DB_USERNAME
  DB_PASSWORD
  LOG_CHANNEL
)

for VAR in "${VARS[@]}"; do
  VALUE=$(printenv "$VAR")
  if [ -n "$VALUE" ]; then
    if grep -q "^$VAR=" .env; then
      sed -i "s|^$VAR=.*|$VAR=$VALUE|" .env
    else
      echo "$VAR=$VALUE" >> .env
    fi
  fi
done


php artisan clear-compiled
php artisan view:cache
php artisan route:cache
php artisan config:cache

php artisan migrate --force

#php artisan db:seed --force
