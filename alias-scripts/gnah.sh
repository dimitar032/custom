#!/bin/bash
read -r -p "Are you sure you want to delete ALL unstaged files? [y/N] " response
if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
then
    git reset --hard && git clean -df
else
    echo "gnah - Canceled."
fi

