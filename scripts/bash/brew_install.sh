#!/bin/bash

set -e

# Function to check if a command exists
command_exists() {
    command -v "$1" &> /dev/null
}

# Check if Homebrew is installed
if ! command_exists brew; then
    echo "Error: Homebrew is not installed. Please install Homebrew first."
    exit 1
fi

echo "Updating Homebrew..."
brew update

# List of work-related packages
work_packages=(
    aws-vault          # Securely store and access AWS credentials
    awscli             # Official AWS command-line interface
    adr-tools          # Architecture Decision Records tool
    ca-certificates    # Collection of Authority Certificates
    coreutils          # GNU core utilities
    cowsay             # Fun Talking Cow
    git                # Version Control
    fastfetch          # Quick system information fetcher
    fortune            # Random quote generator
    ffmpeg             # Multimedia framework for audio/video processing
    lsd                # Moden 'ls' alternative
    openssl@3          # SSL/TLS cryptography
    pkgconf            # Managing compile and link flags
    powerlevel10k      # Zsh theme
    pyenv              # Python Intepreter Virtual Environments
    pyenv-pip-migrade  # Migrate pip packages between versions
    pyenv-virtualenv   # Create python virtual envionments
    python@3.12        # Python 3.12 interpreter
    python@3.13        # Python 3.13 interpreter
    readline           # Command line editing & history
    sqlite             # Lightweight SQL DB engine
    stow               # Create symlinks for . files
    tesseract          # OCR engine for text recognition
    xz                 # Compression tool and library
    zoxide             # Smarter 'cd' command
    zsh-autosuggestions # Fish-like suggestions for Zsh
    zsh-syntax-highlighting # Syntax highlighting for Zsh
)

# List of personal-use packages
personal_packages=(

)

# List of work-related casks
work_casks=(
    bitwarden          # Password manager
    cloudflare-warp    # Secure Web Connections
    firefox            # Web browser
    freetube           # Open Source Youtube Client
    google-chrome      # Chrome Browser 
    iterm2             # Terminal emulator
    localsend          # Send files locally
    maccy              # Clipboard manager
    obsidian           # Notes App
    openmtp            # Android Phone File Explorer
    slack              # Messaging app
    spotify            # Music streaming
    visual-studio-code # Code editor
    vlc                # Media player
)

# List of personal-use casks
personal_casks=(
    affinity-designer  # Affinity Designer - graphic design
    affinity-photo     # Affinity Photo - editing
    affinity-publisher # Affinity Publisher - layouts and publications
    android-platform-tools # Android Tools
    alfred             # Productivity app for faster access to system files
    alt-tab            # Windows like tabs for Mac
    bitwarden          # Password manager
    cloudflare-warp    # Secure Web Connections
    firefox            # Web browser
    freetube           # Open Source Youtube Client
    google-chrome      # Chrome Browser 
    hiddenbar          # Hide Menu Items
    iterm2             # Terminal emulator
    localsend          # Send files locally
    mediainfo          # Media file info
    mullvadvpn         # VPN service
    obsidian           # Notes App
    openmtp            # Android Phone File Explorer
    slack              # Messaging app
    spotify            # Music streaming
    visual-studio-code # Code editor
    vlc                # Media player
)

# Combine the lists and remove duplicates
all_packages=($(echo "${work_packages[@]} ${personal_packages[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))
all_casks=($(echo "${work_casks[@]} ${personal_casks[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))

# Install or update each package
for pkg in "${all_packages[@]}"; do
    if brew ls --versions "$pkg" > /dev/null; then
        echo "Updating $pkg..."
        brew upgrade "$pkg" || echo "Failed to upgrade $pkg. It may be up-to-date or have issues."
    else
        echo "Installing $pkg..."
        brew install "$pkg" || echo "Failed to install $pkg. It may be unavailable or have issues."
    fi
done

# Install or update each cask
for cask in "${all_casks[@]}"; do
    if brew list --cask --versions "$cask" > /dev/null; then
        echo "Updating $cask..."
        brew upgrade --cask "$cask" || echo "Failed to upgrade $cask. It may be up-to-date or have issues."
    else
        echo "Installing $cask..."
        brew install --cask "$cask" || echo "Failed to install $cask. It may be unavailable or have issues."
    fi
done

echo "All specified packages and casks have been installed or updated!"