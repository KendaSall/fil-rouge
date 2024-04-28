# Utiliser l'image officielle PHP avec Apache
FROM php:7.4-apache

# Exposer le port 80 pour le serveur web Apache
EXPOSE 80

# Copier les fichiers de l'application dans le conteneur
COPY . /var/www/html/

# Installer les dépendances nécessaires
RUN apt-get update && \
    apt-get install -y \
        git \
        libpq-dev \
        && \
    docker-php-ext-install pdo_mysql

# Configuration Apache : activer le module de réécriture et définir le répertoire racine
RUN a2enmod rewrite
RUN sed -i 's!/var/www/html!/var/www/html/public!g' /etc/apache2/sites-available/000-default.conf

# Redémarrer Apache
RUN service apache2 restart

# Point d'entrée : démarrer Apache
CMD ["apache2-foreground"]
