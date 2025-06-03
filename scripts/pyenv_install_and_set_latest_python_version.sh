#!/bin/bash

# This script installs the latest version of Python using Pyenv, and sets it as the global versionp.
# It assumes you already have Pyenv installed and set up.

function check_pyenv_is_installed {
    if command -v pyenv &> /dev/null; then 
        echo "Pyenv is installed ✅"
    else 
        echo "Can't find Pyenv, please check installation"
        exit 1
    fi
}

function get_latest_python_version {
    # Get the latest stable Python version by filtering only versions in x.y.z format and picking the last one.
    latest_python_version=$(pyenv install --list | grep -E "^\s*[0-9]+\.[0-9]+\.[0-9]+$" | tail -1 | tr -d ' ')
    echo "Latest Python version: $latest_python_version"
}
function get_latest_ruby_version {
    # List latest stable versions, filter out any versions containing a hypen, then pick the last one.
    # https://stackoverflow.com/questions/30179484/install-latest-stable-version-of-ruby-using-rbenv
    latest_ruby_version=$(rbenv install -l | grep -v - | tail -1)
}

function check_latest_python_installed {
    if echo "$(pyenv versions)" | grep -qw "$latest_python_version"; then
        return 0 # Already installed
    else
        return 1 # Not installed
    fi
}

function install_latest_python {
    echo "Installing Python $latest_python_version..."
    pyenv install $latest_python_version &> /dev/null
    echo "Successfully installed Python $latest_python_version 🎉"
}

function set_global_python_to_latest {
    pyenv global $latest_python_version &> /dev/null
    echo "Successfully set latest Python to $latest_python_version 🎉"
}

# Main script execution

check_pyenv_is_installed
get_latest_python_version

if check_latest_python_installed; then
    echo "Latest version ($latest_python_version) already installed."
    set_global_python_to_latest
else
    install_latest_python
    set_global_python_to_latest
fi