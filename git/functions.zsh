gfm () {
  # From https://stackoverflow.com/a/67170894/477761
  local defaultBranch=$(git branch -rl '*/HEAD' | rev | cut -d/ -f1 | rev)
  git fetch origin $defaultBranch:$defaultBranch
}

# gp comes by default with the git OMZ plugin and Segment git setup
if alias gp >/dev/null 2>&1; then
  unalias gp
fi
gp () {
  git pull origin $(git rev-parse --abbrev-ref HEAD)
}

gpy () {
  # pull latest changes, then installing dependencies using correct tools based
  # on some basic file heuristics
  gp
  current_dir=$PWD
  cd $(git rev-parse --show-toplevel)
  if [ -f .tool-versions  ] || [ -f .nvmrc ] || [ -f mise.toml ]; then
    # Check that mise is installed
    if [[ $(mise --version) ]]; then
      mise install
    fi
  fi
  if [ -f yarn.lock ] && [[ $(yarn --version) ]]; then
    yarn install
  fi
  if [ -f pnpm-lock.yaml ] && [[ $(pnpm --version) ]]; then
    pnpm install
  fi
  if [ -f package-lock.json ] && [[ $(npm --version) ]]; then
    npm ci
  fi
  if [ -f post-install.local ]; then
    ./post-install.local
  fi
  cd $current_dir
}

grhh () {
  # git reset utility, by default resetting hard to HEAD.
  # Pass in a number to reset to different relative commit.
  INDEX="${1:-0}"
  git reset --hard HEAD~${INDEX}
}

_fzf_complete_gco() {
  local branches
  branches=$(git branch -vv --all)
  _fzf_complete --reverse --multi -- "$@" < <(
    echo $branches
  )
}

_fzf_complete_gco_post() {
  awk '{print $1}'
}
