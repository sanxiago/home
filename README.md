# home
Configuration Files for my roaming home


Setting it up
Create a directory to hold your git database (the .git dir):
```
$ mkdir ~/.dotfiles/
$ cd ~/.dotfiles/
~/.dotfiles$ git init .
```
Create a .gitifnore file that will ignore everything. You can be more conservative here and only ignore things you don't want in git. I like to pick and choose exactly which things I'll add, so I ignore everything by default and then add it later.
```
~/.dotfiles$ echo "*" > .gitignore
~/.dotfiles$ git add -f .gitignore 
~/.dotfiles$ git commit -m "gitignore"
```
Now we've got a repository set up for our files. It's out of the way of our home directory, so the .git directory won't cause any conflicts with other repositories in your home directory. Here comes the magic part that lets us use this repository to keep our home directory in. Add the dgit alias to your .bashrc or .profile, whichever you prefer:

```
~/.dotfiles$ echo "alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=\$HOME'" >> ~/.bashrc
$ bash
~/.dotfiles$ cd ~
$ dgit reset --hard
HEAD is now at 642d86f gitignore
```
Now the repository is checked out in our home directory, and it's ready to have stuff added to it. The dgit reset --hard command might seem spooky (and I do suggest you make a backup before running it), but since we're ignoring everything, it'll work just fine.

Add dependencies using submodules to pull from other github repos, i.e: vim plugins
```
git submodule init
git submodule add https://github.com/vim-airline/vim-airline.git ~/.vim/pack/shapeshed/start/vim-airline
git add .gitmodules vim/pack/shapeshed/start/vim-airline
git commit
```

Easily deploy dotfiles into a new machine:
```
$ ssh someothermachine
$ git clone --recursive https://github.com/sanxiago/home.git ~/.dotfiles
$ alias dgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
$ dgit reset --hard
```

Configure remote key to push changes
```
# create Host entry for key in ~/.ssh/config
Host github.com-sanxiago
    HostName github.com
    User git
    IdentityFile ~/.ssh/sanxiago-github
git remote set-url origin git@github.com-sanxiago:sanxiago/home.git
```

## Thanks to these sources:
### Keep your home dir in git with a detached working directory
https://www.electricmonk.nl/log/2015/06/22/keep-your-home-dir-in-git-with-a-detached-working-directory/

### Installing packages in Vim 8.0 and adding as submodule
https://shapeshed.com/vim-packages/

### Configure ssh keys for remote urls using ssh config
https://www.keybits.net/post/automatically-use-correct-ssh-key-for-remote-git-repo/

### README.md markup
https://github.com/tchapi/markdown-cheatsheet/blob/master/README.md
