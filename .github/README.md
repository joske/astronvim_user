# AstroNvim User Configuration

A user configuration for [AstroNvim](https://github.com/AstroNvim/AstroNvim)

## 🛠️ Installation

To use this config, make sure to have the following packages available on the system:

- astronvim (duh)
- rust
- nodejs
- python-pip
- ruby
- zip/unzip/gzip
- lazygit/git
- latex
- ripgrep
- lldb
- optional: gdu, bottom

#### Make a backup of your current nvim and shared folder

```shell
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
```

#### Clone AstroNvim

```shell
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim
```

#### Create a new user repository from this template

Press the "Use this template" button above to create a new repository to store your user configuration.

You can also just clone this repository directly if you do not want to track your user configuration in GitHub.

#### Clone the repository

```shell
git clone https://github.com/<your_user>/<your_repository> ~/.config/nvim/lua/user
```

#### Start Neovim

```shell
nvim
```
