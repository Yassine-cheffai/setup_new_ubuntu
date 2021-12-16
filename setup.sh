#download nvim.appimage and rust-analyzer
#add this to .zshrc  alias nvim="nvim.appimage"
cp ~/Downloads/nvim.appimage ~/.local/bin/nvim.appimage
cp ~/Downloads/rust-analyzer ~/.local/bin/rust-analyzer

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

# install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


#setup neovim
mkdir ~/.conf/nvim
cp init.vim ~/.conf/nvim.init.vim

# setup tmux
cp .tmux.conf ~/.tmux.conf
