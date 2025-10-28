#!/usr/bin/env bash

set -e

if git rev-parse --git-dir > /dev/null 2>&1; then
    TAG=$(git describe --tags --always --dirty)
else
    TAG="v0.0.0-dev"
fi

echo "$TAG"

