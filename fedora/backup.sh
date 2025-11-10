#!/bin/bash
#
# ========================================================================
#
# Script Name: backup.sh
# Author: Simone Roncallo
# Description: Incremental backup with rsync
# Requirements: rsync
# Instructions: Identify the SRC/ROOT directories and run
#
# ========================================================================

# Timestamp
TIMESTAMP=$(date +%F_%H-%M-%S)

# Directories
USER=<user>
SRC="/home/${USER}/"
ROOT="/run/media/${USER}/Backup"

DST="${ROOT}/${USER}"
DIR="${ROOT}/history/$TIMESTAMP"
LOG="${ROOT}/history/$TIMESTAMP.txt"
mkdir -p "$DST"
mkdir -p "$DIR"

# Test
rsync -avP --dry-run --delete --backup --backup-dir="$DIR" --exclude-from=./.rsyncignore "$SRC" "$DST" --log-file="$LOG"

# Run
#rsync -avP --delete --backup --backup-dir="$DIR" --exclude-from=./rsyncignore "$SRC" "$DST" --log-file="$LOG"

echo "Completed."
