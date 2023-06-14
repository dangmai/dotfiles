# dangmai's dotfiles

My dotfiles, forked from [Zach Holman's legendary dotfiles][], in combination with
the excellent [oh-my-zsh][].

To install:
```bash
mkdir -p ~/dev/src/github.com/dangmai
cd ~/dev/src/github.com/dangmai
git clone https://github.com/dangmai/dotfiles.git
cd dotfiles
bash script/bootstrap
```

The installer does NOT install `oh-my-zsh`, and will override `oh-my-zsh` when
necessary, using stuffs in the dotfiles folder structure (for more information,
refer to Zach Holman's documentation). Then change the paths in
`zsh/zshrc.dotsymlink` and git config in `git/gitconfig.dotsymlink`.

One-liner to install oh-my-zsh and this dotfiles:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" && \
mkdir -p ~/dev/src/github.com/dangmai && \
cd ~/dev/src/github.com/dangmai && \
git clone https://github.com/dangmai/dotfiles.git && \
cd dotfiles && \
bash script/bootstrap
```

[Zach Holman's legendary dotfiles]: https://github.com/holman/dotfiles
[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh
