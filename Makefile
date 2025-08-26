.PHONY: help build dev devfb topic message consumer purge

help: # 도움말 출력
	@echo "Available targets:"
	@grep -E '^[a-zA-Z0-9_-]+:.*#' Makefile | sed -E 's/:.*#/\t- /' | sort
	@echo
	@echo "Usage: make <target> [VARIABLE=value]"

## r/ Docker

build: # Docker 이미지 빌드
	docker-compose build

dev: # 로컬 개발환경 구성
	docker-compose up -d --remove-orphans

devfb: ## 로컬 개발환경 구성 w/ filebeat
	docker-compose -f docker-compose.yml -f extensions/filebeat/filebeat-compose.yml up --remove-orphans

topic: # Kafka 토픽 생성 w/ zookeeper
	@if [ -z "${TOPIC}" ]; then \
	  echo "Error: TOPIC variable is not set."; \
	  exit 1; \
	fi
	docker-compose exec kafka kafka-topics.sh --create --topic ${TOPIC} --partitions 1 --replication-factor 1 --if-not-exists --zookeeper zookeeper:2181

produce: # 메시지 프로듀스
	@if [ -z "${TOPIC}" ]; then \
	  echo "Error: TOPIC variable is not set."; \
	  exit 1; \
	fi
	docker-compose exec kafka kafka-console-producer.sh --topic ${TOPIC} --broker-list localhost:9092

consume: # 메시지 컨슘
	@if [ -z "${TOPIC}" ]; then \
	  echo "Error: TOPIC variable is not set."; \
	  exit 1; \
	fi
	docker-compose exec kafka kafka-console-consumer.sh --topic ${TOPIC} --from-beginning --bootstrap-server localhost:9092

purge: # 자원정리
	docker-compose rm -fsv
