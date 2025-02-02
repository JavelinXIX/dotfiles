#!/bin/zsh


cd ~
echo "[*] Start Deploy"

# Create .config
if [ ! -d ~/.config ]; then
    mkdir ~/.config
fi

# Clone dotfiles
if [ ! -d ~/dotfiles ]; then
    echo "[+] clone dotfilels"
    git clone https://github.com/JavelinXIX/dotfiles.git
fi

# Install oh-my-zsh
#if [ -d ~/.oh-my-zsh ]; then
#    echo "[+] oh-my-zsh installed"
#    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#fi

# Linking neovim dotfiles
which zsh > /dev/null
if [[ $? -eq 0 ]] then
    echo "[+] Neovim installed"
    ln -s  ~/dotfiles/nvim ~/.config/nvim
    echo "[+] Link ~/.config/nvim to ~/dotfiles/nvim"
fi

# Linking wezterm dotfiles
which wezterm > /dev/null
if [[ $? -eq 0 ]] then
    echo "[+] Wezterm installed"
    ln -s  ~/dotfiles/wezterm ~/.config/wezterm
    echo "[+] Link ~/.config/wezterm to ~/dotfiles/wezterm"
fi

echo "[*] Finish!!"
