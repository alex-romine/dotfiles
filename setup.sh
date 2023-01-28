if ! which brew; then
  echo 'installing homebrew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew install \
  zsh \
  nvim \
  tmux \
  node

if ! stat ~/.gitconfig; then
  echo 'setting up git to use gitconfig file'
  git config --global user.name job
fi

echo 'setting up symlinks'
CURRENT_DIR="$(dirname -- "${BASH_SOURCE[0]}" )"
FULL_PATH="$(realpath ${CURRENT_DIR})"

ln -sf ${FULL_PATH}/zshrc ~/.zshrc
ln -sf ${FULL_PATH}/zsh_aliases ~/.zsh_aliases
ln -sf ${FULL_PATH}/vimrc ~/.vimrc
ln -sf ${FULL_PATH}/tmux.conf ~/.tmux.conf
ln -sf ${FULL_PATH}/gitconfig ~/.gitconfig
echo 'completed symlinks'


echo 'end steps'
tmux source-file ~/.tmux.conf

echo 'import gruvbox for iterm from Downloads'
curl  -o ~/Downloads/gruvbox.itermcolors https://raw.githubusercontent.com/herrbischoff/iterm2-gruvbox/master/gruvbox.itermcolors

echo 'file completed'
