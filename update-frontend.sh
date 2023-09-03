#!/bin/bash
# Run on a Linux-compatible shell

# Configure Shell (https://www.baeldung.com/linux/move-all-files-except-one)
set shopt -s extglob .bashrc

# Clone Skeleton
git clone https://github.com/skeletonlabs/skeleton.git ../../

# Add Skeleton Repository As Remote
git remote add skeleton ../../skeleton

# Fetch Skeleton Repository
git remote update skeleton

# Merge Skeleton
git merge --allow-unrelated-histories skeleton/dev

