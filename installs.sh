# ZSH install
if command -v git >/dev/null 2>&1; then
  if [ ! -d ~/.oh-my-zsh ]; then
      echo "Installing OMZ"
      curl -L http://install.ohmyz.sh | zsh
  else
      echo "OMZ already installed"
  fi
else
  ./oh-my-zsh.sh
fi

rm -f ~/.zshrc.pre-oh-my-zsh
