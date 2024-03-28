alias be="bundle exec"
alias cop-b="git diff origin/master..HEAD --name-only --diff-filter=AMR | xargs bundle exec rubocop --force-exclusion -c .rubocop.yml -a"
alias cop-s="git diff --cached --name-only --diff-filter=AMR | xargs bundle exec rubocop --force-exclusion -c .rubocop.yml -a"
alias cop-w="git diff --name-only --diff-filter=AMR | xargs bundle exec rubocop --force-exclusion -c .rubocop.yml -a"
alias cop="git diff --name-only --diff-filter=AMR | xargs bundle exec rubocop --force-exclusion -c .rubocop.yml -a"
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
