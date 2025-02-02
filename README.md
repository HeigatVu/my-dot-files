# All my config TMUX neovim and ZSH
## Clone repo:

```
git clone git@github.com:HeigatVu/my-dot-files.git
```
Then,
```
cp -r ./nvim ~/.config/
cp ./.tmux.conf ~/
cp ./.zshrc ~/
```

## Install nerd font
Clone repo
```
git clone https://github.com/ryanoasis/nerd-fonts.git
````
Then,
```
cd nerd-fonts
./install.sh <FONT-NAME>
```
*NOTE: I often use FiraCode, JetBrainMono
## ZSH
### Install ZSH.

```
sudo apt install zsh-autosuggestions zsh-syntax-highlighting zsh
```

### Set Zsh as default

```
chsh -s $(which zsh)
```
	

### Install Oh my ZSH.

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install powerlevel10k
Clone and move to oh my zsh themes dir
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```
Then, In terminal, we run this line to config

```
p10k configure
```

### Install plugins.
 - autosuggesions plugin
 
```
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
```
	
 - zsh-syntax-highlighting plugin
 
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```
	
 - zsh-fast-syntax-highlighting plugin
 
```
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
```
	
 - zsh-autocomplete plugin

```
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
```

## TMUX
### Install **Tmux Plugin Manager**
Clone repo
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
Then, we reload tmux
```
tmux source ~/.tmux.conf
```

**INSTALLING PLUGINS:**
1. Add new plugin to `~/.tmux.conf` with `set -g @plugins '...'`
2. Press `prefix` + `I` (capital I, as in Install) to fetch the plugin
*NOTE: I am set `prefix` being `ctrl` + `a`

## NEOVIM


# Keymap
## TMUX

## NEOVIM


# References

 - [Oh my ZSH](https://github.com/ohmyzsh/ohmyzsh)
 - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
 - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
 - [zsh-fast-syntax-highlighting](https://github.com/zdharma/fast-syntax-highlighting)
 - [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete)
 - [Nerd-font](https://www.nerdfonts.com/)
 - [Installing nerd-font](https://github.com/ryanoasis/nerd-fonts)
 - [Tmux plugin manger](https://github.com/tmux-plugins/tpm?tab=readme-ov-file)
