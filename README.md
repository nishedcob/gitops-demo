# gitops-demo
Operations Repository for Demoing GitOps

## Services

### Gitea Git Server
```bash
make minikube_port_forward_gitea
```
Visit http://localhost:3000

**User:** `gitops`

**Password:** `gitopsDemo`

### Flux GitOps Operator
```bash
make minikube_bootstrap_gitops
```
