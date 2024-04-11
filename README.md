# My machine setup steps and configurations

## Setup nvim
- Install nvim - https://github.com/neovim/neovim/blob/master/INSTALL.md

```
brew install neovim
```
- Configure nvim - https://github.com/ipetrovbg/nvim-config

###### Additional resources

- Install fzf - https://github.com/junegunn/fzf#using-homebrew
- Install zoxide - https://github.com/ajeetdsouza/zoxide#getting-started
- Install exa - https://github.com/ogham/exa
- Install ripgrep (helps with telescope searching) - https://github.com/BurntSushi/ripgrep?tab=readme-ov-file#installation

#### Resources:
- https://github.com/ipetrovbg?tab=repositories

---

## Setup Rust
- https://www.rust-lang.org/learn/get-started

---

## Setup Nodejs
- Install nvm - https://github.com/nvm-sh/nvm#installing-and-updating
```
nvm install node # "node" is an alias for the latest version
```

---

## Setup WezTerm
- Install wezterm - https://wezfurlong.org/wezterm/install/macos.html#installing-on-macos

```
brew install --cask wezterm
```

WezTerm configuration
`.wezterm.lua`

---

## Windows Manager MacOS

- Rectangle - https://rectangleapp.com/

## Browser

- Arc - https://arc.net/

## Password Manager
- KeepassXC - https://keepassxc.org/

---

## Note taking
- Obsidian - https://obsidian.md/download 

---

## Postman
- https://www.postman.com/downloads/

## PostgreSQL
- https://www.postgresql.org/download/macosx/
```
brew install postgresql@15
```
Add to PATH
e.g. `export PATH="/Library/PostgreSQL/16/bin:${PATH}"`

---

## Starship

Cross-shell prompt
`.config/starship.toml`
- https://starship.rs/guide/#%F0%9F%9A%80-installation

---

## Clipboard Manager

- https://github.com/ipetrovbg/PerfectClip

---

## Setup `aws-vault`

`brew install --cask aws-vault`

- https://github.com/99designs/aws-vault/ 

---

## Setup JAVA

`export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-21.jdk/Contents/Home`

- https://docs.azul.com/core/install/macos

---
