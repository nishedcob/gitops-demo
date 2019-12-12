
help:
	@echo "%.d                               - ensure directory with name %.d exists"
	@echo "minikube                          - download minikube cli tool"
	@echo "kubectl                           - download kubectl cli tool"
	@echo "fluxctl                           - download fluxctl cli tool"
	@echo "jq                                - download jq cli tool"
	@echo "versions                          - print to stdout CLI tools and their versions"
	@echo "versions.txt                      - save the output of 'make versions' as versions.txt"
	@echo "minikube_start                    - ensure that minikube is running in the desired configuration"
	@echo "minikube_create_dirs              - ensure that desired directories and paths exist within minikube"
	@echo "minikube_provision_gitea          - ensure that Gitea is provisioned in Minikube"
	@echo "minikube_port_forward_gitea       - expose Gitea to localhost"
	@echo "minikube_bootstrap_gitea_ops_repo - bootstrap GitOps repo into Gitea"
	@echo "minikube_bootstrap_gitops         - bootstrap GitOps onto minikube using k8s/gitops/flux.yaml"
	@echo "minikube_provision_demo_app       - ensure that Demo App is provisioned in Minikube"
	@echo "minikube_port_forward_demo_app    - expose Gitea to localhost"
	@echo "minikube_port_forward_demo        - expose on localhost ports required in the Demo"
	@echo "minikube_port_forward_demo_stop   - stop demo port forward"
	@echo "minikube_flux_sync                - active fluxctl sync to speed up demo"
	@echo "minikube_delete                   - delete current minikube instance"
	@echo "k8s/gitea/%.ini                   - convert k8s/gitea/src/%.json into k8s/gitea/%.ini for further conversion later"
	@echo "k8s/gitea/namespace.yaml          - create YAML definition for Kubernetes gitea namespace"
	@echo "k8s/gitea/secret.yaml             - create YAML definition for Kubernetes gitea namespace secrets (from k8s/gitea/secrets.ini)"
	@echo "k8s/gitea/config.yaml             - create YAML definition for Kubernetes gitea namespace configMap (from k8s/gitea/config.ini)"
	@echo "k8s/gitea/gitea.sql.yaml          - create YAML definition for Kubernetes gitea namespace configMap for gitea.sql file (from k8s/gitea/gitea.sql)"
	@echo "k8s/gitea/gitea.sql               - dump Gitea's database as k8s/gitea/gitea.sql"
	@echo "k8s/gitops/flux.yaml              - generate flux configuration using fluxctl and store it as k8s/gitops/flux.yaml"

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

fluxctl:
	curl -L \
		https://github.com/fluxcd/flux/releases/download/1.15.0/fluxctl_linux_amd64 \
		-o $@
	chmod -v +x $@

jq:
	curl -L \
		https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64 \
		-o $@
	chmod -v +x $@

versions: minikube kubectl fluxctl jq
	./minikube version
	./kubectl version
	./fluxctl version
	./jq --version

versions.txt: minikube kubectl fluxctl jq
	make versions | grep -v "make" > $@

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
	./minikube status || (./minikube start && ./minikube status)

minikube_create_dirs: minikube_start
	./minikube ssh "sudo mkdir -pv /gitea-data"
	./minikube ssh "sudo mkdir -pv /giteadb/dumps"
	./minikube ssh "sudo mkdir -pv /giteadb/data"
	./minikube ssh "sudo mkdir -pv /giteadb/restore"

minikube_provision_gitea: minikube_create_dirs k8s/gitea/namespace.yaml \
		k8s/gitea/secret.yaml k8s/gitea/config.yaml k8s/gitea/gitea.sql.yaml
	./kubectl apply -f k8s/gitea/namespace.yaml
	./kubectl apply -f k8s/gitea/config.yaml
	./kubectl apply -f k8s/gitea/gitea.sql.yaml
	./kubectl apply -f k8s/gitea/secret.yaml
	./kubectl apply -f k8s/gitea/db.yaml
	./kubectl apply -f k8s/gitea/gitea.yaml
	./kubectl apply -f k8s/gitea/.

minikube_port_forward_gitea: minikube_provision_gitea
	./kubectl port-forward -n gitea svc/gitea 3000:3000 2222:2222

minikube_bootstrap_gitea_ops_repo: minikube_provision_gitea
	for i in `seq 1 7`; do \
		export gitea_replicas=$$(./kubectl get deploy -n gitea gitea -o json | ./jq '.status.readyReplicas') ; \
		( \
			[ ! -z "$$gitea_replicas" ] && [ "$$gitea_replicas" != "null" ] && \
			[ $$gitea_replicas -gt 0 ] \
		) || ( \
			printf "Waiting " && for i in `seq 1 10`; do \
			 	sleep 1s && printf "." ; \
			done ; \
			echo "" ; \
		) ; \
	done
	./kubectl port-forward -n gitea svc/gitea 3000:3000 &
	sleep 5s
	curl -X GET "http://localhost:3000/api/v1/repos/gitops/ops-demo" -H "accept: application/json"
	curl -X POST "http://gitops:gitopsDemo@localhost:3000/api/v1/user/repos" -H "accept: application/json" -H "Content-Type: application/json" -d "{ \"auto_init\": false, \"description\": \"Operations Repo for GitOps Demo\", \"name\": \"ops-demo\", \"private\": false}"
	git remote add gitea http://gitops:gitopsDemo@localhost:3000/gitops/ops-demo.git || true
	git push gitea master
	netstat -tupln | grep :3000
	kill $$(netstat -tupln | grep :3000 | awk '{ print $$7 }' | awk -F/ '{ print $$1 }' | sort | uniq)
	netstat -tupln | grep :3000 || true

minikube_bootstrap_gitops: k8s/gitops/flux.yaml minikube_bootstrap_gitea_ops_repo
	./kubectl apply -f $<

minikube_provision_demo_app: minikube_start kubectl
	./kubectl apply -f k8s/app/.

minikube_port_forward_demo_app: minikube_provision_demo_app
	./kubectl port-forward svc/demo-static-app 8080:80

minikube_port_forward_demo:
	( ./kubectl port-forward -n gitea svc/gitea 3000:3000 || true ) &
	( ./kubectl port-forward -n gitea svc/gitea 2222:2222 || true ) &
	./kubectl port-forward svc/demo-static-app 8080:80 2>&1 | tee /tmp/demo-app-port-forward.log &
	while true ; do \
		if grep -q "an error occurred forwarding 8080" /tmp/demo-app-port-forward.log; then \
			kill $$(netstat -tupln | \
				grep ":8080" | awk '{ print $$7 }' | \
				awk -F/ '{ print $$1 }' | sort | uniq) ; \
				make minikube_port_forward_demo ; \
		fi; \
	done

minikube_port_forward_demo_stop:
	sudo netstat -tupln
	for port in ":3000" ":2222" ":8080"; do \
		sudo netstat -tupln | grep $$port ; \
		kill $$(sudo netstat -tupln | \
			grep $$port | awk '{ print $$7 }' | \
			awk -F/ '{ print $$1 }' | sort | uniq) ; \
		sudo netstat -tupln | grep $$port || true ; \
	done

minikube_flux_sync: minikube_bootstrap_gitops fluxctl
	watch "./fluxctl sync"

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

k8s/gitops/flux.yaml: fluxctl
	./fluxctl install --git-user=flux-user --git-email=noreply@fluxcd.org \
		--git-branch=master \
		--git-url=http://gitea.gitea.svc.cluster.local:3000/gitops/ops-demo.git \
		--git-path=k8s/app > $@
