# My dotfiles

This directory holds the dotfiles for my Arch Linux setup running the **Hyprland** compositor.
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/427d110a-d7ca-4c44-8487-658396fde536" />
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/dcb53787-cd80-417d-a672-7c8673d4da90" />


Features

- **Window Manager**: Hyprland with Dwindle layout.

- **Terminal**: Kitty with transparency and Nerd Fonts.

- **Shell**: Fish with fastfetch on startup.

- **Editor**: Neovim fully configured for development (LSP, Treesitter, Completions).

- **Theme**: Consistent [Catppuccin Mocha](https://catppuccin.com/palette/) colors across the system.

- **Bar**: Waybar (custom styled).

- **Launcher**: Wofi.

- **Workflow**: Custom integration for LaTeX + Inkscape figures and Zathura PDF viewing.


Ensure you have the following packages installed to replicate this setup completely:

| Category | Application | Description |
|---|:---:|---|
| WM | hyprland | The Wayland Compositor |
| Terminal | kitty | GPU-accelerated terminal emulator |
| Shell | fish | User-friendly command line shell |
| Bar | waybar | Status bar |
| Launcher | wofi | Application launcher |
| Notifications | dunst | Notification daemon |
| File Manager | ranger | Console file manager |
| Editor | neovim | Hyperextensible Vim-based text editor |
| Wallpaper | hyprpaper | Wallpaper utility |
| Lock Screen | hyprlock | Lock screen utility |
| Screenshot | grim + slurp | Screenshot tools |
| Clipboard | wl-clipboard | Clipboard manager |
| System Info | fastfetch | System information fetcher |
| PDF Viewer | zathura | Lightweight, keyboard-driven PDF viewer |
| Vector Graphics | inkscape | Used for creating LaTeX figures |
| Symlinks | stow | GNU Stow for managing dotfiles |
| Font | ttf-hack-nerd | Hack Nerd Font (Required for icons) |


## 1. Install Dependencies

```
sudo pacman -S hyprland kitty fish waybar wofi dunst ranger neovim hyprpaper hyprlock grim slurp wl-clipboard fastfetch zathura zathura-pdf-mupdf inkscape stow ttf-hack-nerd git npm unzip nvidia-dkms
```
## 2. Clone repo
```
git clone https://github.com/slimcio112/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

## 3. Use **Stow** to create symlinks

```
# Inside ~/dotfiles
stow .
```

---

## Workflow

My configuration includes custom  **LuaSnip** setup to make graphics in **Inkscape** for **LaTeX** documents faster.
1. In normal mode press ```<leader>fi``` (mapped in ```lua/plugins/luasnip.lua```).
2. Enter name for your figure
3. The script checks if ```img/``` dir exists if not it creates it then it generates minimal SVG template, and opens **Inkscape**.
4. When you save your figure in Inskacpe, it is automatically saved as PDF and ready to insert in **LaTeX**.
5. Start typing "fig" to create figure environment using fig snippet.
```
\begin{figure}[h!]
   \centering
   \includegraphics[width=0.6\textwidth]{img/diagram1.pdf}
   \caption{Description}
   \label{fig:label}
\end{figure}
```

---

## Zathura PDF Viewer

Zathura is the default PDF viewer with the [**Catppuccin Mocha**](https://catppuccin.com/palette/) theme.
<img width="1920" height="1080" alt="image" src="https://github.com/user-attachments/assets/fc4a276b-bc07-4c61-bbe6-16c265210b74" />
Press ```Ctrl + r``` to toggle the recolor mode. This switches the document color scheme between the orginal and dark.

---

## Neovim config

My setup is build using **Lazy.nvim** plugin manager and has a modular structure for easy maintance.
 
### File structure
- ```init.lua```: Requires the configuration modules from ```lua/config/```.
- ```lua/config/```:
    - ```options.lua```: Sets the leader key (space) and Vim options like clipboard, siftwidth, etc.
    - ```keymaps.lua```: Keybindings
    - ```lazy.lua```: Bootstraps ```lazy.nvim``` and imports plugins.
- ```lua/plugins/*.lua```: Ech file in this directory returns a Lua table defining a plugin.

## Plugins list


| Category            | Plugin            | Function                                      |
|---------------------|-------------------|-----------------------------------------------|
| Package Manager     | lazy.nvim         | Plugin management                             |
| LSP & Formatting    | nvim-lspconfig    | LSP configurations                            |
|                     | mason.nvim        | package manager for LSP                       |
|                     | conform.nvim      | Auto-formatting                               |
| Completion          | blink.cmp         | Autocompletion engine                         |
|                     | LuaSnip           | Snippet engine                                |
| Treesitter          | nvim-treesitter   | Syntax highlighting & parsing                 |
| UI & Theme          | catppuccin        | Color scheme                                  |
|                     | lualine.nvim      | Status line                                   |
|                     | noice.nvim        | UI for messages, cmdline, and popupmenu       |
|                     | nvim-notify       | Fancy notifications                           |
|                     | which-key.nvim    | Keybinding helper popup                       |
| Utilities           | snacks.nvim       | QoL tools (Terminal, LazyGit, etc.)           |
|                     | vimtex            | LaTeX support                                 |

## Neovim keymaps
Press space while in normal mode to see avaible keybindings or inspect them manually in config files.
