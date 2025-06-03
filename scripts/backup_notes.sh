#!/bin/bash

# Fail immediately if a command fails
set -e

cd "$NOTES_PATH" || { echo "Directory $NOTES_PATH not found!"; exit 1; }
git add -A

git commit -m "Backup on $(date '+%Y-%m-%d %H:%M:%S')" || {
  echo "No changes to commit"
  exit 0
}

git push origin main