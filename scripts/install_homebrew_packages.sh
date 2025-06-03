#!/bin/bash

# This script installs packages listed in the Brewfiles (common, work, and personal) and updates them if needed.

ENVIRONMENT_EXPORT="ENVIRONMENT"
BREWFILE_PATH="$SCRIPT_DIR/brewfiles"

function check_homebrew_is_installed {
    if command -v brew &> /dev/null; then 
        echo "✅ Homebrew is installed"
    else 
        echo "❌ Can't find Homebrew. Please install it before running this script."
        exit 1
    fi
}

function update_homebrew {
    echo "Updating Homebrew..."
    brew update
    if [ $? -eq 0 ]; then
        echo "✅ Homebrew updated successfully"
    else
        echo "❌ Failed to update Homebrew. Check your internet connection or try running 'brew update' manually."
        exit 1
    fi
    
    echo "Upgrading outdated packages..."
    brew upgrade
    if [ $? -eq 0 ]; then
        echo "✅ Homebrew packages upgraded successfully"
    else
        echo "❌ Failed to upgrade packages. Check the error messages and try again."
        exit 1
    fi
    
    # Good thread about upgrading casks: https://stackoverflow.com/questions/31968664/upgrade-all-the-casks-installed-via-homebrew-cask
    echo "Upgrading outdated casks..."
    brew upgrade --cask --greedy
    if [ $? -eq 0 ]; then
        echo "✅ Homebrew casks upgraded successfully"
    else
        echo "❌ Failed to upgrade casks. Check the error messages and try again."
        exit 1
    fi
}

function install_packages_from_brewfile {
    common_brewfile_path="$BREWFILE_PATH/brewfile_common"
    
    echo "Installing packages from common Brewfile..."
    brew bundle --file="$common_brewfile_path"
    
    if [ $? -eq 0 ]; then
        echo "✅ Successfully installed packages from Brewfile"
    else
        echo "❌ There was an error installing packages. Check the Brewfile and try again."
        exit 1
    fi

    if [ "$ENVIRONMENT_EXPORT" == "work" ]; then
        echo "Installing packages from work Brewfile..."
        work_brewfile_path="$BREWFILE_PATH/brewfile_work"
        brew bundle --file="$work_brewfile_path"
    fi

    if [ "$ENVIRONMENT_EXPORT" == "personal" ]; then
        echo "Installing packages from personal Brewfile..."
        personal_brewfile_path="$BREWFILE_PATH/brewfile_personal"
        brew bundle --file="$personal_brewfile_path"
    fi
}

# Main script execution
check_homebrew_is_installed
update_homebrew
install_packages_from_brewfile