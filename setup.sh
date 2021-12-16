#download nvim.appimage and rust-analyzer
#add this to .zshrc  alias nvim="nvim.appimage"
mkdir ~/.local/bin
cp ~/Downloads/nvim.appimage ~/.local/bin/nvim.appimage
chmod +x ~/.local/bin/nvim.appimage
cp ~/Downloads/rust-analyzer ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

sudo apt install git
sudo apt install python-is-python3
sudo apt install python3-pip
sudo apt install xclip
sudo apt install tmux
sudo apt install guake
sudo apt install bat
ln -s /usr/bin/batcat ~/.local/bin/bat
sudo apt install silversearcher-ag
sudo apt install nodejs
sudo apt install npm
sudo snap install beekeeper-studio
sudo snap install insomnia
sudo apt install zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#install docker
sudo snap install docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

#install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


#setup neovim
mkdir ~/.config/nvim
cp init.vim ~/.config/nvim.init.vim

# setup tmux
cp .tmux.conf ~/.tmux.conf

pip install flake8
pip install black
npm install -g create-react-app
