# dangmai's dotfiles

My dotfiles, forked from [Zach Holman's legendary dotfiles][], in combination with
the excellent [oh-my-zsh][]. I almost always use Debian derivated OSes, so keep
that in mind.

To install:
```
git clone https://github.com/dangmai/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
```

The installer will also install `oh-my-zsh`, but will override `oh-my-zsh` when
necessary, using stuffs in the dotfiles folder structure (for more information,
refer to Zach Holman's documentation). Then change the paths in
`zsh/zshrc.symlink` and git config in `git/gitconfig.symlink`.

[Zach Holman's legendary dotfiles]: https://github.com/holman/dotfiles
[oh-my-zsh]: https://github.com/robbyrussell/oh-my-zsh