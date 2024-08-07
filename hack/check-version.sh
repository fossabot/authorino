#!/usr/bin/env bash

# Get the current git branch
branch=$(git rev-parse --abbrev-ref HEAD)

# Check if the branch is "main"
if [[ "$branch" == "main" ]]; then
    version="latest"
# Check if the branch starts with "v" followed by a number
elif [[ "$branch" =~ ^v[0-9] ]]; then
    version="${branch:1}"
# Otherwise, use the branch name as the version
else
    version="$branch"
fi

# Use yq to set build.version to version variable
yq eval ".build.version = $version" -i build.yaml
