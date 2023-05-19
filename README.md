# dotfiles
dotfiles that I use for arch linux but they should work on other oses


## linux install
run
```
git clone --bare https://github.com/Xgames123/dotfiles.git $HOME/.dotfiles/git
git --dit-dir=$HOME/.dotfiles/git --work-tree=$HOME reset --hard HEAD
```
If you already have the repo cloned you can just use git commands but instead of git use dot
```
dot pull
```
