# ZSH stores sourced script location in $0.
# The rest of the pattern is a POSIX trick to go up n levels
REPO_LOCATION=${0%/*/*}

dotfiles_update () {
  echo "Updating dotfiles"

  if [[ $(git -C "$REPO_LOCATION" status --short) != '' ]];
  then
    echo "dotfiles dir is dirty, doing nothing"
    # This script is sourced, so we can't use exit.
    return 1
  fi

  git -C "$REPO_LOCATION" pull --rebase
}

# dotfiles_update
