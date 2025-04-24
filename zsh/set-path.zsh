# https://docs.brew.sh/Installation#post-installation-steps
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
  path=(
    $(brew --prefix ruby)/bin
    $path
  )
fi

# https://github.com/sdkman/homebrew-tap?tab=readme-ov-file#installation
if [[ -s /opt/homebrew/opt/sdkman-cli/libexec/bin/sdkman-init.sh ]]; then
  export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
  source "${SDKMAN_DIR}/bin/sdkman-init.sh"
fi

if [[ -d ~/Library/Application\ Support/JetBrains/Toolbox/scripts ]]; then
  path=(
    ~/Library/Application\ Support/JetBrains/Toolbox/scripts
    $path
  )
fi
