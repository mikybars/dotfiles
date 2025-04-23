# Dotfiles

My personal dotfiles repository that relieves the pain of switching MacBooks every 2 years or so 😂

![Neovim running inside Warp terminal](https://github.com/user-attachments/assets/1bd5f4d7-0bb8-4e8c-852c-6af10ebc7365)

## Installation

```bash
git clone https://github.com/mikybars/dotfiles.git
cd dotfiles
# if case you want to live dangerously
# git switch experimental
./install
```

The [installation script](install.conf.yaml) will:

- Symlink configuration files to appropriate locations according to the [XDG Base Directory Specification](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
- Install Homebrew
- Install the tools that I use on a daily basis

Additionally [some extra goodies](install.extra.conf.yaml) are included:

- Connect to GitHub on the CLI
- Install Java if missing

## About

This repository leverages [dotbot](https://github.com/anishathalye/dotbot) to automate the whole thing. Kudos on such a fantastic tool 🙇‍♂️

## Testing

From time to time I find comforting to test my dotfiles on a clean macOS environment, especially after every major update
of the OS and several commits landing on `stable` from the `experimental` branch. For that matter I resort to
[Orka Desktop](https://www.macstadium.com/orka), a virtual desktop solution for macOS. VM images for the last versions
of the OS released by Apple are kept in the [orka-images](https://github.com/macstadium/orka-images) repository and can
be pulled in right from the app.
