#!/bin/bash

# This script checks if Homebrew is installed, and if not, it installs it.

function check_homebrew_is_installed {
    if command -v brew &> /dev/null; then 
        echo "✅ Homebrew is already installed"
    else 
        echo "❌ Homebrew not found. Please install Homebrew first."
        return 1
    fi
}

function install_homebrew {
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
    if command -v brew &> /dev/null; then
        echo "✅ Successfully installed Homebrew"
    else
        echo "❌ There was a problem installing Homebrew. Please check the installation steps."
        return 1
    fi
}

# Main script execution

if ! check_homebrew_is_installed; then
    install_homebrew
else
    echo "No Homebrew installation needed."
fi