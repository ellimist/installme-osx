#!/bin/sh

# Install XCode Command Line Tools
xcode-select --install

# setup folder structure
mkdir ~/Documents/workspace
mkdir ~/Documents/repos

sudo gem update --system
sudo chown -R $USER /Library/Ruby /Library/Perl /Library/Python

echo "gem: -n/usr/local/bin" >> ~/.gemrc

# brew setup
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

# install Rails
gem install rails

# ZSH
curl -L github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Core utils
brew install coreutils
brew install findutils

# Dependencies
brew install jpeg-turbo
brew install optipng
brew install readline

# Apps
brew install ack
brew install thefuck
brew install bash-completion
brew install the_silver_searcher
brew install ant
brew install git
brew install git-flow
brew install mercurial
brew install mysql
brew install postgresql
brew install node
brew install irssi
brew install phantomjs
brew install unrar
brew install trash
brew install tree
brew install wget

wget https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
wget https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash

brew install tig
brew install ffind

gem install passenger
brew install nginx --with-passenger --with-debug --with-spdy --with-gunzip \
  && sudo mkdir -p /Library/LaunchDaemons \
  && sudo cp -r Config/nginx /usr/local/etc/nginx \
  && sudo cp LaunchDaemons/homebrew.mxcl.nginx.plist /Library/LaunchDaemons/ \
  && sudo launchctl load /Library/LaunchDaemons/homebrew.mxcl.nginx.plist

# OSX native apps
brew install caskroom/cask/brew-cask

function installcask() {
    brew cask install "${@}" 2> /dev/null
}

# dev-related programs
installcask dropbox
installcask copy
installcask google-chrome
installcask firefox
installcask iterm2

# utils
installcask skype
installcask vlc
installcask 1password
installcask spotify
installcask slack
installcask flux
installcask transmission
installcask sequel-pro


# npm dependencies that I'm not likely to live without
npm install -g jshint
npm install -g jsxhint
npm install -g grunt-cli
npm install -g gulp
npm install -g yo
npm install -g http-server


# vim setup
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Go to bundle folder
cd ~/.vim/bundle/

# Get all plugins
git clone https://github.com/Valloric/MatchTagAlways.git
git clone https://github.com/jiangmiao/auto-pairs.git
git clone https://github.com/alvan/vim-closetag
git clone https://github.com/kien/ctrlp.vim.git ctrlp.vim
git clone https://github.com/mattn/emmet-vim.git
git clone https://github.com/scrooloose/syntastic.git
git clone git://github.com/godlygeek/tabular.git
git clone https://github.com/vim-scripts/tlib.git
git clone https://github.com/bling/vim-airline ~/.vim/bundle/vim-airline
git clone git://github.com/altercation/vim-colors-solarized.git
git clone git://github.com/tpope/vim-fugitive.git
git clone git://github.com/tpope/vim-rails.git
git clone git://github.com/tpope/vim-bundler.git
git clone https://github.com/tomtom/tlib_vim.git
git clone https://github.com/MarcWeber/vim-addon-mw-utils.git
git clone https://github.com/garbas/vim-snipmate.git
git clone https://github.com/honza/vim-snippets.git
git clone https://github.com/elzr/vim-json.git
git clone https://github.com/ruyadorno/vim-change-indent.git
git clone https://github.com/groenewege/vim-less.git
git clone https://github.com/ap/vim-css-color.git
git clone https://github.com/hail2u/vim-css3-syntax
git clone https://github.com/othree/html5.vim.git
git clone https://github.com/pangloss/vim-javascript.git
git clone https://github.com/nathanaelkane/vim-indent-guides.git

## Get dotfiles repo
cd ~/Documents/repos/
git clone https://github.com/ellimist/dotfiles.git

## Get zsh bundle manager
git clone https://github.com/tarjoilija/zgen.git

## Setup symlinks
cd ~/
ln -s Documents/repos/dotfiles/.gitconfig .gitconfig
ln -s Documents/repos/dotfiles/.vimrc .vimrc
ln -s Documents/repos/dotfiles/.vim .vim
ln -s Documents/repos/dotfiles/.zshrc .zshrc

# Set zsh as default shell
chsh -s /bin/zsh

echo 'All done!'
