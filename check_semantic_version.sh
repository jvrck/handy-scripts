#!/bin/bash

: '
This script compares two semantic versions.

Usage:
    ./check_semantic_version.sh 1.0.0 1.0.1
    ./check_semantic_version.sh 1.0.0 1.0.0
'

# Function to compare semantic versions
compare_versions() {
    version1=$1
    version2=$2

    if [[ "$version1" == "$version2" ]]; then
        echo "The versions are equal"
    elif [[ "$version1" > "$version2" ]]; then
        echo "Version $version1 is greater than $version2"
    else
        echo "Version $version1 is lower than $version2"
    fi
}

# Check if two arguments are provided
if [[ $# -eq 2 ]]; then
    compare_versions "$1" "$2"
else
    echo "Please provide two semantic versions as arguments"
    exit 1
fi
