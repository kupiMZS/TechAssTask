.PHONY: help build up down logs clean deploy health

help: ## Show this help
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

build: ## Build Docker images
	docker-compose build

up: ## Start all containers
	docker-compose up -d

down: ## Stop all containers
	docker-compose down

logs: ## View logs
	docker-compose logs -f

clean: ## Clean everything
	docker-compose down -v
	docker system prune -f

deploy: ## Deploy to server
	./scripts/deploy.sh

health: ## Run health checks
	./scripts/health-check.sh

rollback: ## Rollback deployment
	./scripts/rollback.sh

ssl-renew: ## Renew SSL certificates
	./scripts/ssl-renew.sh