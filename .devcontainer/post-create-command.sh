#!/bin/sh
# shellcheck disable=SC1090

curl -fsSL https://mise.run | sh

SHELL_NAME=$(basename "$SHELL")

case "$SHELL_NAME" in
  bash) SHELL_RC="$HOME/.bashrc" ;;
  zsh) SHELL_RC="$HOME/.zshrc" ;;
esac

if [ -n "$SHELL_RC" ]; then
  echo "eval \"\$(mise activate $SHELL_NAME)\"" >> "$SHELL_RC"
  . "$SHELL_RC"
fi

mise trust
mise use -g rust@stable && mise install
mise run install && mise run hygiene

echo "[ * ] GitHub Codespace environment setup is complete. Happy coding! <3"
