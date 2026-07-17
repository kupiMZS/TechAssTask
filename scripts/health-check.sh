#!/bin/bash

# Health check script
# Usage: ./health-check.sh

set -e

echo "🏥 Running health checks..."

# Check Docker containers
echo "🔍 Checking containers..."
docker-compose ps

# Check site 1
echo "🌐 Checking Site 1..."
if curl -s -o /dev/null -w "%{http_code}" http://localhost/site1/ | grep -q "200\|301\|302"; then
    echo "✅ Site 1 is healthy"
else
    echo "❌ Site 1 is unhealthy"
    exit 1
fi

# Check site 2
echo "🌐 Checking Site 2..."
if curl -s -o /dev/null -w "%{http_code}" http://localhost/site2/ | grep -q "200\|301\|302"; then
    echo "✅ Site 2 is healthy"
else
    echo "❌ Site 2 is unhealthy"
    exit 1
fi

echo "✅ All services are healthy!"