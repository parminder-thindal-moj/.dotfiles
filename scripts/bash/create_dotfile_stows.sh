#! bin/bash

# set the dir where the dotfiles are stored:
DOTFILES_DIR="$HOME/.dotfiles"

# Log file location
LOG_FILE="$HOME/dotfile_creation.log"

CURRENT_DATETIME=$(date +"%Y-%m-%d %H:%M:%S")

function log() {
    echo "$CURRENT_DATETIME - $1" | tee -a "$LOG_FILE"
}

cd "$DOTFILES_DIR" || { echo "Directory: $DOTFILES_DIR not found!" } exit 1; }

log "Creating stows:"

# funct name

# Loop over each folder in the dotfiles directory
for folder in */ ; do

    # Remove trailing slash
    folder="${folder%/}"
    
    # Run stow for each folder, ignoring .DS_Store files and adopting existing files
    echo "Stowing $folder..."
    stow -v -t ~ --adopt --ignore='^\.DS_Store$' "$folder"

done


log "All dotfiles have been stowed"

stow -v -t ~ --ignore='^\.DS_Store$' */