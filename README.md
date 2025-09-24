# My dotfiles

This directory holds the dotfiles for my Arch Linux setup. I use **symlinks** to manage these files, which allows me to track configuration files from anywhere in my ```$HOME``` directory.
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/427d110a-d7ca-4c44-8487-658396fde536" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/dcb53787-cd80-417d-a672-7c8673d4da90" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/fc4a276b-bc07-4c61-bbe6-16c265210b74" />


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

### Greetd

```
pacman -S greetd
```

## Installation

check out the files in your home directory using git chekout

```
git clone https://github.com/slimcio112/dotfiles.git
cd dotfiles
```

then use stow in ```~/dotfiles``` to create symlinks

```
stow .
```
