#!/usr/bin/env zsh

: '
This zsh hook checks if a git repository is in a work or personal directory.
After you determine which profile you need, you can set the git config to the correct profile.

To setup, source this file in your .zshrc file:
source ~/path/to/check-git-profile.sh

Replace values <PATH_1>, <PATH_2>, <USER_NAME> and <USER_EMAIL> with relevant values.

<PATH_1> and <PATH_2> should be abosolute paths such as ~/work/ or ~/personal/
'

autoload -U add-zsh-hook
check-git-conf() {
    if [[ -d .git ]]; then
        echo "Git repo detected"
        if echo "$PWD" | grep -q "<PATH_1>"; then
            echo "Set git config to 'personal'"
            git config user.name "<USER_NAME>"
            git config user.email "<USER_EMAIL>"
        fi

        if echo "$PWD" | grep -q "<PATH_2>"; then
            echo "Set git config to 'work'"
            git config user.name "<USER_NAME>"
            git config user.email "<USER_EMAIL>"
        fi
    fi
}
add-zsh-hook chpwd check-git-conf
