COMPOSE_DEV=infrastructure/compose/docker-compose.dev.yml

dev:

	docker compose \
	-f $(COMPOSE_DEV) \
	up


build:

	docker compose \
	-f $(COMPOSE_DEV) \
	build


down:

	docker compose \
	-f $(COMPOSE_DEV) \
	down


logs:

	docker compose \
	-f $(COMPOSE_DEV) \
	logs \
	-f


restart:

	docker compose \
	-f $(COMPOSE_DEV) \
	restart


clean:

	docker compose \
	-f $(COMPOSE_DEV) \
	down \
	-v