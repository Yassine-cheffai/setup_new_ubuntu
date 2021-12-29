#download nvim.appimage and rust-analyzer
#add this to .zshrc  alias nvim="nvim.appimage"

sudo apt update
mkdir ~/.local/bin
cp ~/Downloads/nvim.appimage ~/.local/bin/nvim.appimage
chmod +x ~/.local/bin/nvim.appimage
cp ~/Downloads/rust-analyzer ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

sudo apt install -y git
git config --global user.email "yacincheffai@yahoo.com"
git config --global user.name "Yassine-cheffai"
sudo apt install -y python-is-python3
sudo apt install -y python3-pip
sudo apt install -y python3.9-venv
sudo apt install -y xclip
sudo apt install -y tmux
sudo apt install -y guake
sudo apt install -y bat
ln -s /usr/bin/batcat ~/.local/bin/bat
sudo apt install -y silversearcher-ag
sudo apt install -y nodejs
sudo apt install -y npm
sudo snap install beekeeper-studio
sudo snap install insomnia
sudo apt install -y zsh
sudo apt install -y curl
sudo apt install -y universal-ctags

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
sudo npm install -g create-react-app
sudo npm install -g prettier

#install docker
sudo snap install docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
