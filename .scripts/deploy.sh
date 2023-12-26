#!/bin/bash
set -e

echo "Deployment started ..."

# Turn ON Maintenance Mode or return true
# if already is in maintenance mode
(php artisan down) || true


# Pull the latest version of the app
git pull origin master 



# Install composer dependencies
composer install --optimize-autoloader --no-dev --no-interaction

# Change file permissoion

# Clearing Cache
php artisan cache:clear
php artisan config:clear

# Recreate artisan cache
php artisan optimize

# Run database migrations
php artisan migrate --force

# Turn OFF Maintenance mode
#php artisan up

php artisan serve --host=5.254.124.209 --port=80

echo "Deployment finished!"