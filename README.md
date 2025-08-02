# My dotfiles

This directory contains config files for my Arch Linux. This approach uses symlinks instead of creating bare repo and tracking files in ~/.config so I can add files that are anywhere inside my home directory.
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
