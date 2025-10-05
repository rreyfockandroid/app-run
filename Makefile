build:
	go build -o exec-run-app ./cmd/app/main.go

run: build
	./exec-run-app

docker-build:
	@bash -c 'eval $$(minikube docker-env) && docker build -t exec-run-app:latest .'

redeploy:
	kubectl delete job exec-run-app -n default


argo-create:
	argocd app create exec-run-app \
    --repo https://github.com/rreyfockandroid/app-run \
    --path k8s \
    --dest-namespace default \
    --dest-server https://kubernetes.default.svc \
    --sync-policy automated \
    --self-heal \
    --auto-prune
    
argo-delete:
	argocd app delete exec-run-app --cascade
