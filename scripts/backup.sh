#!/bin/bash

source "$SCRIPTS_DIR/lib.sh"

set -e  # Exit immediately if any command fails

# print_header "Back Up Notes"
# "$SCRIPT_DIR/scripts/backup_notes.sh"
# echo "Notes backed up."

# print_header "Back Up Settings"
# "$SCRIPT_DIR/scripts/backup_settings.sh"
# echo "Settings backed up."

print_header "Pushing Repository"
echo "Pushing latest changes to shared repo."
cd "$SCRIPT_DIR" # Navigate to the root of the Git repository
echo "Adding all changes..."
git add .
echo "Committing changes..."
git commit -m "Automated backup"
echo "Pushing to remote repository..."
git push
echo "Latest changes have been commited and pushed."