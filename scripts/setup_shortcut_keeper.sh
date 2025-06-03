#!/bin/bash

SHORTCUT_KEEPER_DATA_DIRECTORY=$HOME/Library/Containers/com.whidev.shortcut-keeper/Data/Documents

cp -f $SHORTCUT_KEEPER_DATA_DIRECTORY/shortcuts.db $SHORTCUT_KEEPER_DATA_DIRECTORY/shortcuts_backup.db
cp $DOTFILES_DIR/shortcut_keeper/shortcuts.db $SHORTCUT_KEEPER_DATA_DIRECTORY/shortcuts.db 

# Kill and reopen app (to reload the database)
killall "Shortcut Keeper"
sleep 2
open "/Applications/Shortcut Keeper.app"