/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew install zsh

CURRENT_DIR="$( dirname -- "${BASH_SOURCE[0]}" )"

ln -sf ${CURRENT_DIR}/zshrc ~/.zshrc
ln -sf ${CURRENT_DIR}/vimrc ~/.vimrc
ln -sf ${CURRENT_DIR}/tmux.conf ~/.tmux.conf
ln -sf ${CURRENT_DIR}/vimrc ~/.vimrc
ln -sf ${CURRENT_DIR}/gitconfig ~/.gitconfig
