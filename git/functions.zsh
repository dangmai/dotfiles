gfm () {
  # From https://stackoverflow.com/a/67170894/477761
  local defaultBranch=$(git branch -rl '*/HEAD' | rev | cut -d/ -f1 | rev)
  git fetch origin $defaultBranch:$defaultBranch
}

gpy () {
  # pull latest changes, then installing dependencies using correct tools based
  # on some basic file heuristics
  git pull
  if [ -f .tool-versions  ] || [ -f .nvmrc ]; then
    # Check that asdf is installed
    if [[ $(asdf --version) ]]; then
      asdf install
    fi
  fi
  if [ -f yarn.lock ] && [[ $(yarn --version) ]]; then
    yarn install
  fi
  if [ -f package-lock.json ] && [[ $(npm --version) ]]; then
    npm ci
  fi
}

grhh () {
  # git reset utility, by default resetting hard to HEAD.
  # Pass in a number to reset to different relative commit.
  INDEX="${1:-0}"
  git reset --hard HEAD~${INDEX}
}
