#!/bin/bash

: '
This function checks if a given tag exists in a git repository.

Usage:
    check_git_tag /path/to/repository v1.0.0
    check_git_tag /path/to/repository v1.0.1
    check_git_tag /path/to/repository v1.0.2
'

function check_git_tag() {
    repository_path="$1"
    tag="$2"
    
    # Change directory to the repository path
    cd "$repository_path" || exit
    
    # Fetch all tags from remote repository
    git fetch --tags --quiet
    
    # Check if the given tag exists
    if git rev-parse "$tag" >/dev/null 2>&1; then
        echo "Tag '$tag' exists in the repository"
    else
        echo "Tag '$tag' does not exist in the repository"
    fi
    
    # Change back to the previous directory
    cd - || exit
}
