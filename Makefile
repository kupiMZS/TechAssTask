# Load .env file
include .env
export $(shell sed 's/=.*//' .env)

.PHONY: help up down logs clean

help:
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

up: ## Start containers with .env
	docker-compose --env-file .env up -d

down: ## Stop containers
	docker-compose down

logs: ## View logs
	docker-compose logs -f

clean: ## Clean everything
	docker-compose down -v