# My dotfiles

This directory holds the dotfiles for my Arch Linux setup. I use **symlinks** to manage these files, which allows me to track configuration files from anywhere in my ```$HOME``` directory.
<img width="1915" height="1080" alt="image" src="https://github.com/user-attachments/assets/c530b6a3-79bd-4f44-98fd-c3667be1ad8f" />

## Requirments

Ensure you have installed

### Git

```
pacman -S git
```

### Stow

```
pacman -S stow
```

## Installation

check out the files in your home directory using git chekout

```
$ git clone https://github.com/slimcio112/dotfiles.git
$ cd dotfiles
```

then use stow in ~/dotfiles to create symlinks

```
$ stow .
```
