#!/bin/sh

# Install basic development tools
#
# authour: Arthur Granado (ag47)

set -e

# Install Homebrew
echo "Check if Homebrew is installed."
IS_BREW_INSTALLED=$(brew --version >/dev/null 2>&1)
if [[ $IS_BREW_INSTALLED ]]; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  echo "Homebrew installed."
else
  echo "Homebrew is already intalled."
fi

IS_HELPER_TOOLS_INSTALLED=$(thefuck --version  >/dev/null 2>&1)
if [[ $IS_HELPER_TOOLS_INSTALLED ]]; then
  echo "Intalling helper tools..."
  brew install fzf \
               thefuck

  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
  echo "Helper tools installed!"
else
  echo "Helper tools already intalled."
fi

echo "Check Dracula theme."
DRACULA_THEME="$HOME/.dracula.zsh-theme"
echo "DRACULA_THEME=$DRACULA_THEME"
if [ ! -d $DRACULA_THEME ]; then
  echo "There is no Dracula theme. Installing..."
  git clone https://github.com/dracula/zsh.git $DRACULA_THEME
  ln -s $DRACULA_THEME/dracula.zsh-theme $OH_MY_ZSH/themes/dracula.zsh-theme
  echo "Dracula theme has been installed"
fi

echo "Restart ZSH configuration"
source ${ZDOTDIR:-$HOME}/.zshrc

echo "Thank you!"

