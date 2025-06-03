#!/bin/bash

# This script switches to a specified git branch and pulls the latest changes.
# If no branch name is provided, it will default to the 'main' branch.
# If 'main' does not exist, it will fallback to the 'develop' branch.

source "$SCRIPTS_DIR/lib.sh"

# Function to switch to the specified branch and pull the latest changes
function switch_and_pull {
    local branch=$1

    # Check if the branch name is provided
    if [ -z "$branch" ]; then
        echo "Error: No branch name provided."
        exit 1
    fi

    # Fetch all updates from the remote repository
    git fetch origin

    # Check if the branch exists in the remote repository
    if git show-ref --verify --quiet refs/remotes/origin/$branch; then
        # Switch to the specified branch
        git checkout $branch
        
        # Pull the latest changes
        git pull origin $branch
    else
        echo "Error: Branch '$branch' does not exist in the remote repository."
        exit 1
    fi
}

function set_branch_name_to_switch_to {
    # Set the branch name (default to 'main' then 'develop' if not provided as an argument)
    if [ -z "$1" ]; then
        # Fetch updates from the remote repository to ensure we have the latest branch information
        git fetch origin
        
        # Check for the existence of the 'main' branch in the remote repository
        if git show-ref --verify --quiet refs/remotes/origin/main; then
            BRANCH_NAME="main"
        # If 'main' does not exist, check for the 'develop' branch
        elif git show-ref --verify --quiet refs/remotes/origin/develop; then
            BRANCH_NAME="develop"
        else
            echo "Error: Neither 'main' nor 'develop' branches exist in the remote repository."
            exit 1
        fi
    else
        # If a branch name is provided as an argument, use it
        BRANCH_NAME=$1
    fi
}

# Main script execution

close_xcode_if_running
set_branch_name_to_switch_to
switch_and_pull $BRANCH_NAME
