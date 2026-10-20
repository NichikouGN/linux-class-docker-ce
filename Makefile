# For Demo 1
demo-1:
	@clear
	@echo -e "\033[1;32mDemo 1: Comparing between single and multi-stage builds\n\033[0m"

	@echo -e "\033[1;32m1. Build the single-stage image and compare the disk usage\033[0m"
	docker compose -f compose.single.yml build ticket-box-frontend --quiet
	@echo -e "\033[1;34mIMAGE        					 ID    	   	DISK  CONTENT SIZE\033[0m"
	@docker images | grep ticket-box-frontend | awk '{printf "%s %s \033[1;32m %s \033[0m %s\n", $$1, $$2, $$3, $$4}'

	@echo -e "\n\n"

	@echo -e "\033[1;32m2. Build the multi-stage image and compare the disk usage\033[0m"
	docker compose -f compose.multi.yml build ticket-box-frontend --quiet
	@echo -e "\033[1;34mIMAGE        					 ID    	   	DISK  CONTENT SIZE\033[0m"
	@docker images | grep ticket-box-frontend | awk '{printf "%s %s \033[1;32m %s \033[0m %s\n", $$1, $$2, $$3, $$4}'
	
# For Demo 2
build-clean:
	@docker compose -f compose.single.yml build order-service --no-cache 

build-single:
	@docker compose -f compose.single.yml build order-service

# For Demo 3
demo-3:
	@docker compose -f compose.single.yml down -v
	@clear
	@echo -e "\033[1;32mDemo 3: Initialize the web app using compose file\n\033[0m"
	@docker compose -f compose.single.yml build 
	@docker compose -f compose.single.yml up -d
	@cd ./ticket-box-backend && npm run migrate && npm run seed
	@cd ..

stripe:
	@cd ./ticket-box-backend && npm run dev:stripe

stop-all:
	@docker compose -f compose.single.yml down -v

# For Demo 4
start-db:
	docker compose -f compose.single.yml up -d postgres

inspect-db:
	psql postgresql://postgres:postgres@localhost:5432/mydb

migrate-seed:
	@cd ./ticket-box-backend && npm run migrate && npm run seed

stop-db:
	@docker compose -f compose.single.yml down postgres

	