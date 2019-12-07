
help:
	@echo "%.d             - ensure directory with name %.d exists"
	@echo "minikube        - download minikube cli tool"
	@echo "minikube_delete - delete current minikube instance"
	@echo "up_dependencies - dependencies required before any up commands"
	@echo "up              - ensure services are running"
	@echo "up_giteadb_d    - ensure Gitea's database is running"
	@echo "gitea.sql       - dump Gitea's database"

%.d:
	mkdir -pv $@

minikube:
	curl \
		https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
		-o $@
	chmod -v +x $@

kubectl:
	curl \
		https://storage.googleapis.com/kubernetes-release/release/`curl -s \
			https://storage.googleapis.com/kubernetes-release/release/stable.txt \
		`/bin/linux/amd64/kubectl \
		-o $@
	chmod -v +x $@

jq:
	curl -L \
		https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
		-o $@
	chmod -v +x $@

minikube_delete: minikube
	./minikube delete

k8s/gitea/secrets.ini: k8s/gitea/secrets.json jq
	./jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" $< > $@

k8s/gitea/secret.yaml: k8s/gitea/secrets.ini kubectl jq
	./kubectl create secret generic gitea --from-env-file $< \
		--dry-run=true --output=yaml > $@
	rm -v $<

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
