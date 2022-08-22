fn_exists() {
  # From https://stackoverflow.com/a/9529981
  declare -f -F $1 > /dev/null
  return $?
}

if ! fn_exists goto; then
  PROJECT_DIR=${PROJECTS:-"~/dev"}
  goto() {
    case $1 in

      */*)
        navigate $1
      ;;

      *)
        navigate ${GO_DEFAULT:-${GH_ORG_DEFAULT}}/$1
      ;;

    esac
  }

  git_clone() {
    for repo in $@; do
      if [[ "$repo" == */* ]]; then
        local dir=$PROJECT_DIR/src/github.com/$repo
        git clone ssh://git@github.com/$repo.git $dir
        cd $dir
      else
        local dir=$PROJECT_DIR/src/github.com/${USER_DEFAULT:-${GH_ORG_DEFAULT}}/$repo
        git clone ssh://git@github.com/${USER_DEFAULT:-${GH_ORG_DEFAULT}}/$repo.git $dir
        cd $dir
      fi
    done
  }

  navigate() {
    cd ${PROJECT_DIR}/src/github.com/$1 &> /dev/null ||
    git_clone $1 2> /dev/null ||
    echo "repo @ $1 does not exist"
  }

  _zsh_goto() {
    base=$PROJECT_DIR/src/github.com/
    compadd $(find $base -maxdepth 2 -mindepth 2 | sed "s|$base/||")
    compadd $(find $base/${GO_DEFAULT:-${GH_ORG_DEFAULT}} -maxdepth 1 -mindepth 1 | sed "s|$base/${GO_DEFAULT:-${GH_ORG_DEFAULT}}/||")
  }

  if type compdef &> /dev/null ; then
    compdef _zsh_goto goto
  fi
fi
