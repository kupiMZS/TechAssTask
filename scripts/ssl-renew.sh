#!/bin/bash

# SSL certificate renewal script
# Usage: ./ssl-renew.sh

set -e

echo "🔐 Renewing SSL certificates..."

# Stop nginx if using certbot standalone
docker-compose stop nginx

# Renew certificates
certbot renew --standalone --preferred-challenges http-01

# Restart nginx
docker-compose up -d nginx

echo "✅ SSL certificates renewed successfully!"