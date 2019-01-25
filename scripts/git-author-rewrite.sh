#!/usr/bin/env bash

print_help_and_exit() {
    echo ""
    echo "Example of usage:"
    echo "    env OLD_EMAIL='old-email@example.com' NEW_NAME='Your name' NEW_EMAIL='new-email@example.com'"
    exit 1
}

[[ -z "$OLD_EMAIL" ]] && echo "OLD_EMAIL is empty." && print_help_and_exit
[[ -z "$NEW_NAME" ]] && echo "NEW_NAME is empty." && print_help_and_exit
[[ -z "$NEW_EMAIL" ]] && echo "NEW_EMAIL is empty." && print_help_and_exit

git filter-branch $@ --env-filter '
if [ "$GIT_COMMITTER_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_COMMITTER_NAME="$NEW_NAME"
    export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
fi
if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ]
then
    export GIT_AUTHOR_NAME="$NEW_NAME"
    export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
fi
' --tag-name-filter cat -- --branches --tags

