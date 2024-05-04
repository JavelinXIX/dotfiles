#!/bin/zsh


cd ~
echo "[*] Start Deploy"

# Create .config
if [ -d ~/.config ]; then
    mkdir ~/.config
fi

# Clone dotfiles
if [ -d ~/dotfiles ]; then
    echo "[+] clone dotfilels"
    git clone https://github.com/JavelinXIX/dotfiles.git
fi

# Install oh-my-zsh
if [ -d ~/.oh-my-zsh ]; then
    echo "[+] Install oh-my-zsh"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Linking neovim dotfiles
retcode=`pacman -Qs neovim`
if [[ $retcode -eq 0 ]] then
    echo "[+] Neovim installed"
    ln -s ~/.config/nvim ~/dotfiles/nvim
    echo "[+] Link ~/.confing/nvim to ~/dotfiles/nvim"
fi

# Linking wezterm dotfiles
retcode=`pacman -Qs wezterm`
if [[ $retcode -eq 0 ]] then
    echo "[+] Wezterm installed"
    ln -s ~/.config/wezterm ~/dotfiles/wezterm
    echo "[+] Link ~/.confing/wezterm to ~/dotfiles/wezterm"
fi

echo "[*] Finish!!"
