
##########################
# - Remove Unused Packages
# Test:
# # sudo apt autoremove
##########################
# - Remove Unnecessary Dependencies
# Test:
# # sudo apt autoclean
##########################
# - Clean Package Cache
# Test:
# # sudo apt clean
##########################
# - dpkg for Removing Packages
# Test:
# # sudo dpkg --remove <package_name>
##########################
# - dpkg for Removing Packages and config files
# Test:
# # sudo dpkg --purge <package_name>
##########################
# - Remove Old Kernels
# Test: uname -r
# # sudo apt --purge remove linux-image-<version>
##########################
# - Unused Snap Packages
# Test: snap list
# # sudo snap remove <snap_name>
##########################
# - Old Log Files
# Test:
# #sudo journalctl --vacuum-time=7d
# #sudo journalctl --vacuum-time=100M # (MB)
##########################
# - bleachbit for Deep Cleanup
# - sudo apt install bleachbit
# Test:
# # sudo bleachbit
##########################
# - du to Check Disk Usage
# Test:
# # du -h --max-depth=1 ~
##########################
# - Orphaned Packages with deborphan
# sudo apt install deborphan
# Test:
# # deborphan
# # sudo apt-get remove --purge $(deborphan)
##########################
# - Thumbnails Cache
# Test:
# # rm -rf ~/.cache/thumbnails/*
##########################


Please generate a test for the following commands:
sudo apt autoremove;
sudo apt autoclean;
sudo apt clean;
sudo dpkg --remove <package_name>;
sudo dpkg --purge <package_name>;
sudo apt --purge remove linux-image-<version>;
sudo snap remove <snap_name>;
sudo journalctl --vacuum-time=7d;
sudo journalctl --vacuum-time=100M # (MB);
sudo bleachbit;
deborphan;
sudo apt-get remove --purge $(deborphan);
rm -rf ~/.cache/thumbnails/*;

###########################

# Claude

Please generate a test that counts the files and the file size for the following commands without actually executing the command :

sudo apt autoremove;
sudo apt autoclean;
sudo apt clean;
sudo dpkg --remove <package_name>;
sudo dpkg --purge <package_name>;
sudo apt --purge remove linux-image-<version>;
sudo snap remove <snap_name>;
sudo journalctl --vacuum-time=7d;
sudo journalctl --vacuum-time=100M # (MB);
sudo bleachbit;
deborphan;
sudo apt-get remove --purge $(deborphan);
rm -rf ~/.cache/thumbnails/*;

#!/bin/bash

# System Cleanup Dry Run Size Checker
# This script estimates potential file and space savings without executing cleanup commands

set -e

# Color codes
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to format bytes to human-readable size
format_size() {
    local size=$1
    local -a units=("B" "KB" "MB" "GB" "TB")
    local i=0
    local formatted_size=$size

    while [ $formatted_size -ge 1024 ] && [ $i -lt 4 ]; do
        formatted_size=$(( formatted_size / 1024 ))
        ((i++))
    done

    echo "$formatted_size ${units[$i]}"
}

# Dry run size estimation function
estimate_cleanup_size() {
    local description="$1"
    local directories=("$@:2")

    echo -e "\n${YELLOW}==== Estimating Size for: $description ====${NC}"

    local total_files=0
    local total_size=0

    for dir in "${directories[@]}"; do
        if [ -d "$dir" ]; then
            local dir_files=$(find "$dir" -type f | wc -l)
            local dir_size=$(du -sb "$dir" | cut -f1)

            total_files=$((total_files + dir_files))
            total_size=$((total_size + dir_size))

            echo "Directory: $dir"
            echo "  Files: $dir_files"
            echo "  Size: $(format_size "$dir_size")"
        else
            echo "  Directory not found: $dir"
        fi
    done

    echo -e "${GREEN}Total Files: $total_files${NC}"
    echo -e "${GREEN}Total Estimated Cleanup Size: $(format_size "$total_size")${NC}"
}

# 1. APT Package Management Cleanup Estimation
estimate_cleanup_size "APT Package Cache" \
    "/var/cache/apt/archives" \
    "/var/cache/apt/archives/partial"

# 2. DPKG Package Removal Estimation
# Note: This requires knowing the specific package
read -p "Enter package name for DPKG estimation: " package_name
if [ -n "$package_name" ]; then
    dpkg_dirs=(
        "/var/lib/dpkg/info/${package_name}*"
        "/usr/share/${package_name}"
    )
    estimate_cleanup_size "DPKG Package: $package_name" "${dpkg_dirs[@]}"
fi

# 3. Linux Kernel Image Removal Estimation
read -p "Enter kernel version for image removal estimation: " kernel_version
if [ -n "$kernel_version" ]; then
    kernel_dirs=(
        "/boot/vmlinuz-${kernel_version}"
        "/boot/initrd.img-${kernel_version}"
        "/lib/modules/${kernel_version}"
    )
    estimate_cleanup_size "Linux Kernel Image: $kernel_version" "${kernel_dirs[@]}"
fi

# 4. Snap Package Removal Estimation
read -p "Enter Snap package name for estimation: " snap_name
if [ -n "$snap_name" ]; then
    snap_dirs=(
        "/snap/${snap_name}"
        "/var/snap/${snap_name}"
        "/home/*/.snap/${snap_name}"
    )
    estimate_cleanup_size "Snap Package: $snap_name" "${snap_dirs[@]}"
fi

# 5. Journal Log Size Estimation
estimate_cleanup_size "systemd Journal Logs" \
    "/var/log/journal"

# 6. BleachBit Cleanup Estimation
bleachbit_dirs=(
    "/home/*/.cache"
    "/tmp"
    "/var/tmp"
)
estimate_cleanup_size "BleachBit System Cleanup" "${bleachbit_dirs[@]}"

# 7. Orphaned Packages Estimation
# Note: This requires running deborphan to list packages
echo -e "\n${YELLOW}==== Estimating Orphaned Packages ====${NC}"
echo "Run 'deborphan' manually to list orphaned packages"

# 8. Thumbnail Cache Estimation
thumbnail_dirs=(
    "/home/*/.cache/thumbnails"
)
estimate_cleanup_size "Thumbnail Cache" "${thumbnail_dirs[@]}"

echo -e "\n${GREEN}==== Cleanup Size Estimation Complete ====${NC}"

Save as cleanup_size_check.sh
Make executable: chmod +x cleanup_size_check.sh
Run with: ./cleanup_size_check.sh

###########################

Please generate a test for the following commands :

sudo apt autoremove;
sudo apt autoclean;
sudo apt clean;
sudo dpkg --remove <package_name>;
sudo dpkg --purge <package_name>;
sudo apt --purge remove linux-image-<version>;
sudo snap remove <snap_name>;
sudo journalctl --vacuum-time=7d;
sudo journalctl --vacuum-time=100M # (MB);
sudo bleachbit;
deborphan;
sudo apt-get remove --purge $(deborphan);
rm -rf ~/.cache/thumbnails/*;

# Claude

#!/bin/bash

# System Cleanup and Package Management Command Test Script
# WARNING: Run this script with caution and understand each command before execution

set -e  # Exit immediately if a command exits with a non-zero status

# Color codes for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to log test results
log_result() {
    if [ $? -eq 0 ]; then
        echo -e "${GREEN}[PASS]${NC} $1"
    else
        echo -e "${RED}[FAIL]${NC} $1"
    fi
}

# Preliminary checks
echo -e "${YELLOW}==== Preliminary System Check ====${NC}"
echo "Running as root or with sudo privileges..."
[ "$(id -u)" -eq 0 ] || { echo "Please run as root or with sudo"; exit 1; }

# Test 1: sudo apt autoremove
echo -e "\n${YELLOW}==== Testing sudo apt autoremove ====${NC}"
sudo apt update
sudo apt autoremove -y
log_result "apt autoremove completed"

# Test 2: sudo apt autoclean
echo -e "\n${YELLOW}==== Testing sudo apt autoclean ====${NC}"
sudo apt autoclean
log_result "apt autoclean completed"

# Test 3: sudo apt clean
echo -e "\n${YELLOW}==== Testing sudo apt clean ====${NC}"
sudo apt clean
log_result "apt clean completed"

# Test 4: sudo dpkg --remove (using a sample package)
echo -e "\n${YELLOW}==== Testing sudo dpkg --remove ====${NC}"
# Prompt user for package name
read -p "Enter a package name to remove (e.g., some-test-package): " package_name
if [ -n "$package_name" ]; then
    sudo dpkg --remove "$package_name" || echo -e "${RED}Package may not be installed or removable${NC}"
    log_result "dpkg --remove for $package_name"
fi

# Test 5: sudo dpkg --purge
echo -e "\n${YELLOW}==== Testing sudo dpkg --purge ====${NC}"
read -p "Enter a package name to purge (e.g., some-test-package): " purge_package
if [ -n "$purge_package" ]; then
    sudo dpkg --purge "$purge_package" || echo -e "${RED}Package may not be installed or purgeable${NC}"
    log_result "dpkg --purge for $purge_package"
fi

# Test 6: Remove specific Linux kernel image
echo -e "\n${YELLOW}==== Testing sudo apt --purge remove linux-image ====${NC}"
# List available kernel images
echo "Available kernel images:"
dpkg --list | grep linux-image
read -p "Enter kernel version to remove (e.g., 5.4.0-XX-generic): " kernel_version
if [ -n "$kernel_version" ]; then
    sudo apt --purge remove "linux-image-$kernel_version" -y || echo -e "${RED}Kernel image not found${NC}"
    log_result "Removed linux-image-$kernel_version"
fi

# Test 7: Remove Snap package
echo -e "\n${YELLOW}==== Testing sudo snap remove ====${NC}"
snap list
read -p "Enter Snap package name to remove: " snap_name
if [ -n "$snap_name" ]; then
    sudo snap remove "$snap_name" || echo -e "${RED}Snap package not found${NC}"
    log_result "Removed Snap package $snap_name"
fi

# Test 8: Journal log vacuum by time
echo -e "\n${YELLOW}==== Testing journalctl --vacuum-time ====${NC}"
sudo journalctl --vacuum-time=7d
log_result "Vacuumed journal logs older than 7 days"

# Test 9: Journal log vacuum by size
echo -e "\n${YELLOW}==== Testing journalctl --vacuum-size ====${NC}"
sudo journalctl --vacuum-size=100M
log_result "Vacuumed journal logs to 100MB"

# Test 10: BleachBit system cleanup
echo -e "\n${YELLOW}==== Testing BleachBit ====${NC}"
# Check if BleachBit is installed
if command -v bleachbit &> /dev/null; then
    sudo bleachbit -c system.trash system.cache system.desktop_entry system.localizations
    log_result "BleachBit system cleanup completed"
else
    echo -e "${RED}BleachBit not installed. Skipping test.${NC}"
fi

# Test 11: Find and remove orphaned packages
echo -e "\n${YELLOW}==== Testing deborphan and package removal ====${NC}"
if command -v deborphan &> /dev/null; then
    orphaned_packages=$(deborphan)
    if [ -n "$orphaned_packages" ]; then
        echo "Orphaned packages found:"
        echo "$orphaned_packages"
        read -p "Remove these orphaned packages? (y/n): " remove_confirm
        if [ "$remove_confirm" = "y" ]; then
            sudo apt-get remove --purge $(deborphan) -y
            log_result "Removed orphaned packages"
        fi
    else
        echo "No orphaned packages found."
    fi
else
    echo -e "${RED}deborphan not installed. Skipping test.${NC}"
fi

# Test 12: Clear thumbnail cache
echo -e "\n${YELLOW}==== Clearing Thumbnail Cache ====${NC}"
rm -rf ~/.cache/thumbnails/*
log_result "Cleared thumbnail cache"

echo -e "\n${GREEN}==== System Cleanup Test Complete ====${NC}"

Save it to a file (e.g., system_cleanup_test.sh)
Make it executable: chmod +x system_cleanup_test.sh
Run with sudo: sudo ./system_cleanup_test.sh

