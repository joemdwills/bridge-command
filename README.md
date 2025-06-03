# Scripts_Aliases

## Installation Instructions
1. Setup Git access with SSH. Good instructions [here](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key).
2. Install and setup [1Password](https://1password.com/downloads/mac).
3. Run `setup_oh_my_zsh.sh` to install Oh-My-Zsh.
4. Add shared profile to `.zshrc` file:
```bash
#   -------------------------------
#   Personal Scripts Setup
#   -------------------------------

export ENVIRONMENT="personal" # or 'work'
export SHARED_PROFILE_PATH="$HOME/Scripts_Aliases/aliases/shared_aliases.zsh"
source $SHARED_PROFILE_PATH # Load shared aliases

#   -------------------------------
#   Exports
#   -------------------------------

export NOTES_PATH="$HOME/path/to/notes"
export GH_TOKEN='FETCH_FROM_1PASSWORD' # Required for GH CLI
```
5. Install [Homebrew](https://brew.sh/). 
6. Run `hello.sh` 
7. Once it's setup, just type `hello` from your terminal and the setup script will be re-run.

> Note that the setup script installs and sets up Pyenv, but you'll need to manually run `pyenv_install_and_set_latest_python_version.sh` to actually set the global version with Pyenv. 

## Uninstalling Casks
If you no longer want to use something that was installed via the Brewfiles, you'll need to uninstall them via `brew` to prevent them blocking updates. Run:

```brew uninstall [app] --cask --zap --force```

## Troubleshooting
- Sometimes MacOS will pop up with a warning: "Apple could not verify SOME APP is free of malware". If you're happy, go to System Settings > Privacy and Security and you should be able to open anyway.
- If you get the warning about Spotify being malware, look at [this thread](https://github.com/Homebrew/homebrew-cask/issues/161665#issuecomment-2363665157).
- Sometimes VSCode won't open automatically and you'll get this error: `zsh: command not found: code`. You can solve that by following [these instructions](https://stackoverflow.com/questions/29955500/code-is-not-working-in-on-the-command-line-for-visual-studio-code-on-os-x-ma).


## New Machine Setup
Some interesting security tools [here](https://objective-see.org/index.html).

## Useful Links
- [Finder default commands](https://www.kevinmcox.com/2022/07/change-even-more-finder-options-using-defaults/)