#!/bin/bash
set -e

echo "Vérification de Docker et Docker Compose..."

# Installer Docker si non présent
if ! command -v docker &> /dev/null; then
  echo "Installation de Docker..."
  curl -fsSL https://get.docker.com/ | sh
  sudo usermod -aG docker $USER
fi

# Installer Docker Compose si non présent
if ! docker compose version &> /dev/null; then
  echo "Installation de Docker Compose..."
  sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
fi

echo "Mise à jour et redémarrage des conteneurs Laravel..."

cd /home/ubuntu/Portfolio_valerian

docker compose down workspace nginx php-fpm queue-worker

for image in \
  registry.valeriancharrier.fr/portfolio/workspace:latest \
  registry.valeriancharrier.fr/portfolio/nginx:latest \
  registry.valeriancharrier.fr/portfolio/php-fpm:latest \
  registry.valeriancharrier.fr/portfolio/php-worker:latest
do
  docker image inspect "$image" >/dev/null 2>&1 && docker rmi "$image" || echo "Image non présente localement : $image"
  echo "Téléchargement de : $image"
  docker pull "$image"
done

docker compose up -d workspace nginx php-fpm queue-worker

echo "Déploiement terminé. Liste des conteneurs actifs :"
docker ps
