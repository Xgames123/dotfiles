# dotfiles
dotfiles that I use for arch linux but they should work on other oses

## Installing
IMPORTANT: Your old dotfiles get overwriten when you install the new ones so MAKE A BACKUP OF YOUR OLD DOTFILES

### linux install
run
```
git clone --bare https://github.com/Xgames123/dotfiles.git $HOME/.dotfiles/git
git --git-dir=$HOME/.dotfiles/git --work-tree=$HOME reset --hard HEAD
```
If you already have the repo cloned you can just use git commands but instead of git use dot
```
dot pull
```
