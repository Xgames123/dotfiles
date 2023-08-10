# dotfiles
dotfiles that I use for arch linux but they should work on other oses

## Installing
IMPORTANT: Your old dotfiles get overwriten when you install the new ones so MAKE A BACKUP OF YOUR OLD DOTFILES

run
```
git clone --bare https://github.com/Xgames123/dotfiles.git $HOME/.dotfiles/git
git --git-dir=$HOME/.dotfiles/git --work-tree=$HOME reset --hard HEAD
```
If you already have the repo cloned you can just use git commands but instead of git use dot
```
dot pull
```

### Windows
If you are on linux you can skip this section
1. Install [tinyscripts](https://github.com/Xgames123/tinyscripts)
2. Run this in a administrator shell ```Set-ExecutionPolicy unrestricted```
3. run .dotfiles/scripts/win-install.ps1 

