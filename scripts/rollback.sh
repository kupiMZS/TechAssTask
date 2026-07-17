#!/bin/bash

# Rollback script
# Usage: ./rollback.sh [commit-hash]

set -e

COMMIT=${1:-HEAD~1}
echo "🔄 Rolling back to commit: $COMMIT"

# Revert to previous commit
git revert --no-commit $COMMIT
git commit -m "Rollback to $COMMIT"

# Redeploy
./deploy.sh

echo "✅ Rollback completed!"