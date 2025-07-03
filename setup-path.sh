#!/usr/bin/env bash

# Usage: ./setup-path.sh [zsh|bash]

# Get the absolute path to the repo root (the directory containing this script)
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]:-${(%):-%N}}")" && pwd)"
BIN_PATH="$REPO_ROOT/bin"

# Accept an optional parameter for shell type (lowercase it in a portable way)
if [ -n "$1" ]; then
    SHELL_PARAM=$(printf "%s" "$1" | tr '[:upper:]' '[:lower:]')
else
    SHELL_PARAM=""
fi

# Determine which profile file to use
if [ "$SHELL_PARAM" = "zsh" ]; then
    PROFILE_FILE="$HOME/.zshrc"
elif [ "$SHELL_PARAM" = "bash" ]; then
    PROFILE_FILE="$HOME/.bash_profile"
else
    # Default to current shell
    if [ -n "$ZSH_VERSION" ] || [[ "$SHELL" =~ zsh$ ]]; then
        PROFILE_FILE="$HOME/.zshrc"
    elif [ -n "$BASH_VERSION" ] || [[ "$SHELL" =~ bash$ ]]; then
        PROFILE_FILE="$HOME/.bash_profile"
    else
        # Fallback: update both
        echo "Could not detect shell. Please specify 'zsh' or 'bash' as an argument."
        exit 1
    fi
fi

EXPORT_LINE="export PATH=\"$BIN_PATH:\$PATH\""

# Check if the line is already present
if grep -Fxq "$EXPORT_LINE" "$PROFILE_FILE"; then
    echo "PATH already updated in $PROFILE_FILE."
else
    echo "$EXPORT_LINE" >> "$PROFILE_FILE"
    echo "Added $BIN_PATH to PATH in $PROFILE_FILE."
fi

echo "Please restart your terminal or run: source $PROFILE_FILE" 