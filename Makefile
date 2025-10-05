build:
	go build -o exec-run-app ./cmd/app/main.go

run: build
	./exec-run-app

docker-build:
	@bash -c 'eval $$(minikube docker-env) && docker build -t exec-run-app:latest .'

argo-redeploy:
	argocd app sync exec-run-app --force && kubectl rollout restart deployment exec-run-app

redeploy:
	eval $(minikube docker-env) && docker build -t exec-run-app:latest .
	kubectl rollout restart deployment exec-run-app


argo-create:
	argocd app create exec-run-app \
    --repo https://github.com/rreyfockandroid/app-run \
    --path k8s \
    --dest-namespace default \
    --dest-server "https://kubernetes.default.svc" \
    --sync-policy automated --self-heal --auto-prune