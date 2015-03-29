# dangmai's dotfiles

My dotfiles, forked from [Zach Holman's legendary dotfiles][], in combination with
the excellent [oh-my-zsh][].

To install:
```
git clone https://github.com/dangmai/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

The installer does NOT install `oh-my-zsh`, and will override `oh-my-zsh` when
necessary, using stuffs in the dotfiles folder structure (for more information,
refer to Zach Holman's documentation). Then change the paths in
`zsh/zshrc.dotsymlink` and git config in `git/gitconfig.dotsymlink`.

[Zach Holman's legendary dotfiles]: https://github.com/holman/dotfiles
[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh
