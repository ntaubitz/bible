include .env
export

build:
	docker volume create bible_data
	docker compose build data
	docker compose up -d data
	docker compose build app
console:
	docker compose run --rm --entrypoint="docker/console.sh" app
migrate: build
	docker compose build migrations
	docker compose run --rm migrations
test:
	docker compose run --rm --entrypoint="docker/run_tests.sh '/spec/*'" app
test-file:
	docker compose run --rm --entrypoint="docker/run_tests.sh $(FILE)" app