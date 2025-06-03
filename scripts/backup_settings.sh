#!/bin/bash

# Backup Shortcut Keeper database
echo "Backing up Shortcut Keeper."
SOURCE_FILE="$HOME/Library/Containers/com.whidev.shortcut-keeper/Data/Documents/shortcuts.db"
DEST_FILE="$DOTFILES_DIR/shortcut_keeper/shortcuts.db"
cp "$SOURCE_FILE" "$DEST_FILE"

# Backup VSCode settings
echo "Backing up VSCode settings."
cp "$HOME/Library/Application Support/Code/User/settings.json" $DOTFILES_DIR/vscode

# Backup Xcode Snippets
echo "Backing up XCode snippets."
SNIPPETS_LOCATION="$HOME/Library/Developer/Xcode/UserData/CodeSnippets"
SNIPPETS_BACKUP="$DOTFILES_DIR/xcode/snippets"
cp -a "$SNIPPETS_LOCATION"/. "$SNIPPETS_BACKUP"