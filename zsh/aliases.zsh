alias reload!='. ~/.zshrc'
alias dc='docker compose'
alias nr='npm run'
alias k=kubectl
alias beet="kubectl --context=home exec -it \$(kubectl get pods | grep beets-home | cut -d' ' -f1 | head -n1) -- beet"
alias kh="kubectl --context=home"
alias ks="kubectl --context=seedbox"
alias flexget="kubectl --context=seedbox exec -it \$(kubectl --context=seedbox get pods | grep flexget | cut -d' ' -f1 | head -n1) -c main -- flexget"
