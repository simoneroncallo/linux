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
SRC=/home/
ROOT=/run/media/<user>/Backup

DST="${ROOT}/home"
DIR="${ROOT}/history/$TIMESTAMP"
LOG="${ROOT}/history/$TIMESTAMP.txt"
mkdir -p "$DST"
mkdir -p "$DIR"

# Test
rsync -avP --dry-run --delete --backup --backup-dir="$DIR" "$SRC" "$DST" --log-file="$LOG"

# Backup
# rsync -avP --delete --backup --backup-dir="$DIR" "$SRC" "$DST" --log-file="$LOG"

echo "Completed."
