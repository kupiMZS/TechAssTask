#!/bin/bash

# ============================================
# DEPLOYMENT SCRIPT WITH ENV VARIABLES
# ============================================

set -e

# Load .env file if it exists
if [ -f .env ]; then
    export $(grep -v '^#' .env | xargs)
fi

# Use environment variables or defaults
SERVER_HOST=${SERVER_HOST:-localhost}
SERVER_USER=${SERVER_USER:-kabbo}
DEPLOY_PATH=${DEPLOY_PATH:-/home/kabbo/Desktop/Project/TechAssTask}
NGINX_PORT=${NGINX_PORT:-80}

echo "🚀 Starting deployment..."
echo "📡 Server: $SERVER_HOST"
echo "👤 User: $SERVER_USER"
echo "📁 Path: $DEPLOY_PATH"

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
curl -s http://localhost:$NGINX_PORT/site1/ > /dev/null && echo "✅ Site 1 is healthy"
curl -s http://localhost:$NGINX_PORT/site2/ > /dev/null && echo "✅ Site 2 is healthy"

echo "🌐 Deployment complete!"
echo "Site 1: http://localhost:$NGINX_PORT/site1/"
echo "Site 2: http://localhost:$NGINX_PORT/site2/"