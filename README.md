# My dotfiles

This directory contains config files for my system

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
