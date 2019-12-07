
help:
	@echo "%.d             - ensure directory with name %.d exists"
	@echo "up_dependencies - dependencies required before any up commands"
	@echo "up              - ensure services are running"
	@echo "up_giteadb_d    - ensure Gitea's database is running"
	@echo "gitea.sql       - dump Gitea's database"

%.d:
	mkdir -pv $@

up_dependencies: db.d data.d giteadb_dumps.d

up: up_dependencies
	docker-compose up

up_giteadb_d: up_dependencies
	docker-compose up -d giteadb

gitea.sql: up_giteadb_d giteadb_dumps.d
	export TIMESTAMP=$$(date +%Y.%m%d.%H%M.%S) ; \
	echo "TIMESTAMP=$$TIMESTAMP" ; \
	export DBUSER=$$(cat gitea.env | grep '^POSTGRES_USER=' | sed 's/POSTGRES_USER=//') ; \
	echo "DBUSER=$$DBUSER" ; \
	export DBNAME=$$(cat gitea.env | grep '^POSTGRES_DB=' | sed 's/POSTGRES_DB=//') ; \
	echo "DBNAME=$$DBNAME" ; \
	docker-compose exec giteadb pg_dump --username $$DBUSER $$DBNAME --verbose --format=plain --file=/tmp/dumps/gitea.$$TIMESTAMP.sql ; \
	cp -v giteadb_dumps.d/gitea.$$TIMESTAMP.sql $@
