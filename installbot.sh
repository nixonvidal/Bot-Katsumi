#!/bin/bash

# Colors for better formatting
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to display message in green color
print_success() {
  echo -e "${GREEN}$1${NC}"
}

# Function to display message in yellow color
print_info() {
  echo -e "${YELLOW}$1${NC}"
}

# Welcome message
echo -e "${GREEN}Starting installation process...${NC}"

# Install NVM (Node Version Manager)
print_info "Installing NVM (Node Version Manager)..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
# Cargar .bashrc para asegurarse de que NVM esté disponible
source ~/.bashrc
# Load NVM into the current shell session
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Download and install Node.js
print_info "Downloading and installing Node.js version 20..."
nvm install 20

# Verify the right Node.js version is in the environment
print_info "Verifying Node.js version:"
node_version=$(node -v)
print_success "Node.js version: $node_version"

# Verify the right NPM version is in the environment
print_info "Verifying NPM version:"
npm_version=$(npm -v)
print_success "NPM version: $npm_version"

# Update and upgrade system packages
print_info "Updating and upgrading system packages..."
sudo apt update
sudo apt upgrade -y

# Install necessary packages
print_info "Installing necessary packages..."
sudo apt install -y git nodejs ffmpeg imagemagick yarn

# Clone the repository
print_info "Cloning the repository..."
git clone https://github.com/nixonvidal/Bot-Katsumi

# Change directory to Bot-Katsumi
cd Bot-Katsumi || exit

# Install dependencies
print_info "Installing dependencies..."
npm install

# Start the application
print_success "Installation completed. Starting the application..."
npm start
