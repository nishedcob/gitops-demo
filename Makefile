
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

minikube_start: minikube
	@if ./minikube config get memory | grep -vq '^2048$$'; then \
		echo "minikube memory is not 2048"; \
		./minikube config set memory 2048; \
		./minikube delete; \
	else \
		echo "minikube memory is already 2048" ; \
	fi
	@if ./minikube config get vm-driver | grep -vq '^virtualbox$$'; then \
		echo "minikube vm-driver is not virtualbox"; \
		./minikube config set vm-driver virtualbox; \
		./minikube delete; \
	else \
		echo "minikube vm-driver is already virtualbox" ; \
	fi
	./minikube status || ./minikube start

minikube_create_dirs: minikube_start
	./minikube ssh "sudo mkdir -pv /gitea-data"
	./minikube ssh "sudo mkdir -pv /giteadb/dumps"
	./minikube ssh "sudo mkdir -pv /giteadb/data"
	./minikube ssh "sudo mkdir -pv /giteadb/restore"

minikube_provision_gitea: minikube_create_dirs k8s/gitea/namespace.yaml \
		k8s/gitea/secret.yaml k8s/gitea/config.yaml k8s/gitea/gitea.sql.yaml
	./kubectl apply -f k8s/gitea/.

minikube_port_forward_gitea: minikube_provision_gitea
	./kubectl port-forward -n gitea svc/gitea 3000:3000 2222:2222

minikube_delete: minikube
	./minikube delete

k8s/gitea/%.ini: k8s/gitea/src/%.json jq
	./jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" $< > $@

k8s/gitea/namespace.yaml: kubectl
	./kubectl create namespace gitea --dry-run=true --output=yaml > $@

k8s/gitea/secret.yaml: k8s/gitea/secrets.ini kubectl jq
	./kubectl create secret generic gitea --from-env-file $< \
		--dry-run=true --output=yaml --namespace gitea > $@
	rm -v $<

k8s/gitea/config.yaml: k8s/gitea/config.ini kubectl jq
	./kubectl create configmap gitea --from-env-file $< \
		--dry-run=true --output=yaml --namespace gitea > $@
	rm -v $<

k8s/gitea/gitea.sql.yaml: k8s/gitea/gitea.sql kubectl
	./kubectl create configmap gitea.sql --from-file $< --dry-run=true \
		--output=yaml --namespace gitea > $@

k8s/gitea/gitea.sql: minikube_provision_gitea giteadb_dumps.d
	export TIMESTAMP=$$(date +%Y.%m%d.%H%M.%S) ; \
	echo "TIMESTAMP=$$TIMESTAMP" ; \
	./kubectl exec -n gitea deploy/giteadb -- pg_dump --username gitea gitea --format=plain --file=/tmp/dumps/gitea.$$TIMESTAMP.sql ; \
	./kubectl cp -n gitea $$( ./kubectl get pods -n gitea -o name | grep giteadb | sed 's!pod/!!' ):tmp/dumps/gitea.$$TIMESTAMP.sql giteadb_dumps.d/gitea.$$TIMESTAMP.sql ; \
	cp -v giteadb_dumps.d/gitea.$$TIMESTAMP.sql $@
