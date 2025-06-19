#!/bin/bash

###############################################################################
# One-Click Deployment Script for System Environment Setup
# File: deploy.sh
# Purpose: Deploy setup_env.sh to /etc/profile.d/ with proper permissions
###############################################################################

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to check if user has sudo privileges
check_sudo() {
    if ! sudo -n true 2>/dev/null; then
        print_warning "This script requires sudo privileges to deploy to /etc/profile.d/"
        print_info "You may be prompted for your password..."
        if ! sudo -v; then
            print_error "Failed to obtain sudo privileges"
            exit 1
        fi
    fi
}

# Function to backup existing file if it exists
backup_existing() {
    local target_file="/etc/profile.d/setup_env.sh"
    if [[ -f "$target_file" ]]; then
        local backup_file="${target_file}.backup.$(date +%Y%m%d_%H%M%S)"
        print_info "Backing up existing file to $backup_file"
        sudo cp "$target_file" "$backup_file"
        print_success "Backup created: $backup_file"
    fi
}

# Function to deploy the script
deploy_script() {
    local source_file="./setup_env.sh"
    local target_file="/etc/profile.d/setup_env.sh"
    
    # Check if source file exists
    if [[ ! -f "$source_file" ]]; then
        print_error "Source file $source_file not found!"
        print_info "Please ensure setup_env.sh exists in the current directory"
        exit 1
    fi
    
    # Check syntax of the source file
    print_info "Checking syntax of $source_file..."
    if ! bash -n "$source_file"; then
        print_error "Syntax error in $source_file"
        exit 1
    fi
    print_success "Syntax check passed"
    
    # Create backup if needed
    backup_existing
    
    # Deploy the file
    print_info "Deploying $source_file to $target_file..."
    sudo cp "$source_file" "$target_file"
    
    # Set appropriate permissions
    print_info "Setting permissions..."
    sudo chmod 644 "$target_file"
    sudo chown root:root "$target_file"
    
    print_success "Successfully deployed $target_file"
}

# Function to verify deployment
verify_deployment() {
    local target_file="/etc/profile.d/setup_env.sh"
    
    print_info "Verifying deployment..."
    
    # Check if file exists
    if [[ ! -f "$target_file" ]]; then
        print_error "Deployment verification failed: file not found"
        exit 1
    fi
    
    # Check permissions
    local perms=$(stat -c "%a" "$target_file" 2>/dev/null || stat -f "%A" "$target_file" 2>/dev/null)
    if [[ "$perms" != "644" ]]; then
        print_warning "File permissions are $perms, expected 644"
        print_info "Fixing permissions..."
        sudo chmod 644 "$target_file"
    fi
    
    # Check ownership
    local owner=$(stat -c "%U:%G" "$target_file" 2>/dev/null || stat -f "%Su:%Sg" "$target_file" 2>/dev/null)
    if [[ "$owner" != "root:root" ]]; then
        print_warning "File ownership is $owner, expected root:root"
        print_info "Fixing ownership..."
        sudo chown root:root "$target_file"
    fi
    
    # Check syntax
    if ! sudo bash -n "$target_file"; then
        print_error "Deployed file has syntax errors!"
        exit 1
    fi
    
    print_success "Deployment verification completed"
    
    # Display file info
    print_info "File information:"
    ls -la "$target_file"
}

# Function to test the environment setup
test_environment() {
    print_info "Testing environment setup in a new shell..."
    
    # Test in a subshell
    if bash -c "source /etc/profile.d/setup_env.sh 2>&1" >/dev/null; then
        print_success "Environment setup script loaded successfully"
    else
        print_warning "Environment setup script has issues (check manually)"
    fi
}

# Function to show post-deployment instructions
show_instructions() {
    echo
    print_success "Deployment completed successfully!"
    echo
    print_info "Next steps:"
    echo "  1. Log out and log back in, or start a new shell session"
    echo "  2. Verify environment variables are set correctly:"
    echo "     - echo \$PATH"
    echo "     - echo \$LD_LIBRARY_PATH"
    echo "     - echo \$LMUData"
    echo "     - echo \$PIP_CACHE_DIR"
    echo "  3. Test aliases:"
    echo "     - wnv (watch nvidia-smi or npu-smi)"
    echo "     - pipq (pip with Tsinghua mirror)"
    echo "     - run (if shell_runner.sh exists)"
    echo
    print_info "Configuration will be applied to all new shell sessions."
    print_info "For immediate effect in current session, run: source /etc/profile.d/setup_env.sh"
}

# Main deployment function
main() {
    echo "=========================================="
    echo "  System Environment Setup Deployment"
    echo "=========================================="
    echo
    
    print_info "Starting deployment process..."
    
    # Check requirements
    check_sudo
    
    # Deploy the script
    deploy_script
    
    # Verify deployment
    verify_deployment
    
    # Test environment
    test_environment
    
    # Show instructions
    show_instructions
    
    echo
    print_success "All done! 🎉"
}

# Handle script arguments
case "${1:-}" in
    --help|-h)
        echo "Usage: $0 [--help|--dry-run]"
        echo
        echo "Options:"
        echo "  --help, -h     Show this help message"
        echo "  --dry-run      Show what would be done without actually doing it"
        echo
        echo "This script deploys setup_env.sh to /etc/profile.d/ with proper permissions."
        exit 0
        ;;
    --dry-run)
        print_info "DRY RUN MODE - No changes will be made"
        print_info "Would deploy: ./setup_env.sh -> /etc/profile.d/setup_env.sh"
        print_info "Would set permissions: 644 (root:root)"
        if [[ -f "/etc/profile.d/setup_env.sh" ]]; then
            print_info "Would backup existing file with timestamp"
        fi
        exit 0
        ;;
    "")
        # No arguments, proceed with deployment
        main
        ;;
    *)
        print_error "Unknown argument: $1"
        print_info "Use --help for usage information"
        exit 1
        ;;
esac 