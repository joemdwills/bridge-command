#!/bin/bash

source "$SCRIPTS_DIR/lib.sh"

set -e  # Exit immediately if any command fails

print_header "Check Environment"
"$SCRIPT_DIR/Scripts/check_environment.sh"

print_header "Update Repository"
echo "Pulling latest changes for shared repo."
cd "$SCRIPT_DIR" # Navigate to the root of the Git repository
git pull
echo "Latest changes have been pulled."

print_header "Setting up Homebrew."
"$SCRIPT_DIR/Scripts/install_homebrew.sh"
echo "Homebrew installation completed."
"$SCRIPT_DIR/Scripts/cleanup_homebrew.sh"
echo "Homebrew update and cleanup complete 🧹."

print_header "Install Homebrew Packages and Apps"
echo "Installing Homebrew packages from Brewfiles."
"$SCRIPT_DIR/Scripts/install_homebrew_packages.sh"
echo "Homebrew package setup completed."

print_header "Skipping App Store Apps"
# "$SCRIPT_DIR/Scripts/install_app_store_apps.sh"

print_header "Setup Global Git Config"
"$SCRIPT_DIR/Scripts/setup_git_global_config.sh"
echo "Global Git config setup complete."

print_header "Copy Xcode Snippets"
echo "Copying Xcode snippets to the Xcode directory."
snippets_source="$DOTFILES_DIR/xcode/snippets"
snippets_destination="$HOME/Library/Developer/Xcode/UserData/CodeSnippets"

mkdir -p "$snippets_destination" # Make the directory if it doesn't exists
cp -a "$snippets_source"/. "$snippets_destination"
echo "Xcode snippets have been copied to $snippets_destination."

print_header "Setup System Preferences"
"$SCRIPT_DIR/Scripts/setup_system_preferences.sh"
echo "System preferences setup completed."

# print_header "Setup Login Items"
# osascript "$SCRIPT_DIR/Scripts/setup_login_items.scpt"
# echo "Login items setup completed."

print_header "Setup VSCode"
"$SCRIPT_DIR/Scripts/setup_vscode.sh"
echo "Finished setting up VSCode."

# print_header "(Skipped) Setup Shortcut Keeper"
# "$SCRIPT_DIR/Scripts/setup_shortcut_keeper.sh"
# echo "Finished setting up Shortcut Keeper."

# print_header "(Skipped) Update Notes"
# echo "Pulling latest changes from notes repo."
# cd "$NOTES_PATH"
# git pull
# echo "Latest changes have been pulled."