#!/bin/bash

# Deployment script for manual deployment
# Usage: ./deploy.sh [production|staging]

set -e

ENV=${1:-production}
echo "🚀 Starting deployment to $ENV environment..."

# Pull latest changes
echo "📦 Pulling latest code..."
git pull origin main

# Build and restart containers
echo "🐳 Building and restarting Docker containers..."
docker-compose down

if [ "$ENV" = "production" ]; then
    docker-compose -f docker-compose.prod.yml up -d --build
else
    docker-compose up -d --build
fi

# Check status
echo "✅ Checking container status..."
docker-compose ps

# Health check
echo "🏥 Running health check..."
sleep 5
curl -s http://localhost/site1/ > /dev/null && echo "✅ Site 1 is healthy"
curl -s http://localhost/site2/ > /dev/null && echo "✅ Site 2 is healthy"

echo "🌐 Deployment complete!"
echo "Site 1: http://localhost/site1/"
echo "Site 2: http://localhost/site2/"