if ! which brew >> /dev/null; then
  echo 'installing homebrew'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

if ! stat ~/.oh-my-zsh >> /dev/null; then
  echo 'installing oh-my-zsh'
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

brew tap homebrew/cask-fonts

brew install \
  zsh \
  neovim \
  asdf \
  tmux \
  node \
  the_silver_searcher \
  coreutils \
  rectangle

brew install --cask \
  rancher \
  google-cloud-sdk \
  font-meslo-lg-nerd-font

if ! stat ~/.gitconfig >> /dev/null; then
  echo 'setting up git to use gitconfig file'
  git config --global user.name job
fi

echo 'setting up symlinks'
CURRENT_DIR="$(dirname -- "${BASH_SOURCE[0]}" )"
FULL_PATH="$(realpath ${CURRENT_DIR})"

ln -sf ${FULL_PATH}/zshrc ~/.zshrc
ln -sf ${FULL_PATH}/zsh_aliases ~/.zsh_aliases
ln -sf ${FULL_PATH}/vimrc ~/.nvimrc
ln -sf ${FULL_PATH}/vimrc ~/.vimrc
ln -sf ${FULL_PATH}/tmux.conf ~/.tmux.conf
ln -sf ${FULL_PATH}/gitconfig ~/.gitconfig
mkdir -p ~/.config/nvim
ln -sf ${FULL_PATH}/nvim-init.vim ~/.config/nvim/init.vim
echo 'completed symlinks'


echo 'end steps'
tmux source-file ~/.tmux.conf
rm ~/.zshrc.pre-oh-my-zsh*

echo 'get powerlevel10k'
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo 'import gruvbox for iterm from Downloads'
if ! stat ~/Downloads/gruvbox.itermcolors >> /dev/null; then
  curl  -o ~/Downloads/gruvbox.itermcolors https://raw.githubusercontent.com/herrbischoff/iterm2-gruvbox/master/gruvbox.itermcolors
fi

echo 'file completed'
