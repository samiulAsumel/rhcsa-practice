#!/bin/bash
# Smart Backup Script - Chapter 3 Challenge

# Function: Creates organized backups with timestamps

# Configuration
SOURCE_DIR="$1"
BACKUP_ROOT="$HOME/backups"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="$BACKUP_ROOT/$TIMESTAMP"

# Validation
if [ -z "$SOURCE_DIR" ]; then
    echo "Usage: $0 <directory_to_backup>"
    exit 1
fi

if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: $SOURCE_DIR does not exist!"
    exit 1
fi

# Create backup structure
mkdir -p "$BACKUP_DIR"

# Perform backup
echo "Backing up $SOURCE_DIR..."
cp -r "$SOURCE_DIR" "$BACKUP_DIR/"

# Create symbolic link to latest
ln -sfn "$BACKUP_DIR" "$BACKUP_ROOT/latest"

# Report
echo "Backup completed:"
echo "  Location: $BACKUP_DIR"
echo "  Shortcut: $BACKUP_ROOT/latest"
ls -lh "$BACKUP_DIR"