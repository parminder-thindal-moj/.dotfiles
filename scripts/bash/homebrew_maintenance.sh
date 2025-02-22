#! bin/bash

# Homebrew path 
export PATH="/opt/homebrew/bin:$PATH"

# Log file location
LOG_FILE="$HOME/brew-startup.log"

CURRENT_DATETIME=$(date +"%Y-%m-%d %H:%M:%S")

function log() {
    echo "$CURRENT_DATETIME - $1" | tee -a "$LOG_FILE"
}

function brew_uuc() {
    log "Updating Homebrew..."
    brew update

    log "Upgrading installed packages..."
    brew upgrade

    log "Cleanup old packages..."
    brew cleanup
}

log "Starting Homebrew maintenance"

brew_uuc

log "Homebrew maintenance finished!"
