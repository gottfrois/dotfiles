alias be="bundle exec"
alias console="kubectl exec -it --namespace textmaster --container irb $(kubectl --namespace textmaster get pods --selector app.kubernetes.io/name=irb -o jsonpath='{.items[0].metadata.name}') -- bundle exec pry -r ./config/environment"
alias cop-b="git diff origin/master..HEAD --name-only --diff-filter=MA | xargs bundle exec rubocop --force-exclusion -c .rubocop.yml -a"
alias cop-s="git diff --cached --name-only --diff-filter=MA | xargs bundle exec rubocop --force-exclusion -c .rubocop.yml -a"
alias cop-w="git diff --name-only --diff-filter=MA | xargs bundle exec rubocop --force-exclusion -c .rubocop.yml -a"
alias cop="git diff --name-only --diff-filter=MA | xargs bundle exec rubocop --force-exclusion -c .rubocop.yml -a"
alias dc="docker-compose"
alias fixup="git commit --fixup"
alias g="git"
alias gs="git status"
alias k="kubectl"
alias ks="kubesec"
alias l="ls -l"
alias ll="ls -la"
alias run="docker-compose run --rm"
alias tf="terraform"
alias tm="cd /Users/gottfrois/Code/textmaster-root/services/TextMaster.com"
