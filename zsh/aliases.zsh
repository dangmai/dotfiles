alias reload!='. ~/.zshrc'
alias dc=docker-compose
alias nr='npm run'
alias k=kubectl
alias kb="kubectl exec -it $(kubectl get pods | grep beets | cut -d' ' -f1 | head -n1) -- beet"
