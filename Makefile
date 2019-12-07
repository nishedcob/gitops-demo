
help:
	@echo "%.d - ensure directory with name %.d exists"
	@echo "up  - start services"

%.d:
	mkdir -pv $@

up: db.d data.d
	docker-compose up
