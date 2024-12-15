#!/bin/bash

BACKUP_DIR="/home/rt/mount/red/Backups/arch-desktop"
BACKUP_NAME="$(date +%Y.%m.%d)_arch_desktop.tar.gz"

mkdir -p "$BACKUP_DIR"

tar --exclude='/home/rt/mount' \
  --exclude='/home/rt/.cache' \
  --exclude='/home/rt/.local/share/Trash' \
  -czf "$BACKUP_DIR/$BACKUP_NAME" \
  /home/rt

chmod 600 "$BACKUP_DIR/$BACKUP_NAME"

find "$BACKUP_DIR" -name "*_arch_desktop.tar.gz" -mtime +14 -delete
