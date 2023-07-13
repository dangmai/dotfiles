gfm () {
  # From https://stackoverflow.com/a/67170894/477761
  local defaultBranch=$(git branch -rl '*/HEAD' | rev | cut -d/ -f1 | rev)
  git fetch origin $defaultBranch:$defaultBranch
}
