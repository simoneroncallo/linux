#!/bin/bash
#
# ========================================================================
#
# Script Name: backup.sh
# Author: Simone Roncallo
# Description: Incremental backup with rsync
# Requirements: Mounted drive
# Instructions: Substitute with user and drive names
#
# ========================================================================

set -e

TIMESTAMP=$(date +%Y%m%d-%H%M%S)

# Configuration
DRY_RUN=false
MYUSER=<user>
MYDRIVE=<drive>

SOURCE="/home/${MYUSER}"
MOUNT="/run/media/${MYUSER}/${MYDRIVE}"
if [ ! -d "$MOUNT" ]; then
    echo "Aborted. Mount point not available"; exit 1
fi

BACKUP="${MOUNT}/${MYUSER}ThinkPad-backup"

LAST="${BACKUP}/last"
NEW="${BACKUP}/snapshots/${TIMESTAMP}"
mkdir -p "${BACKUP}/snapshots"
mkdir -p "$NEW"

RUN_MODE=""
if [ "$DRY_RUN" = true ]; then
	RUN_MODE="--dry-run"
fi

rsync -avP $RUN_MODE \
	--delete \
	--link-dest="${LAST}/" \
	--exclude-from="./rsyncignore" \
	"$SOURCE/" "$NEW"

rm -f "$LAST" && ln -s "$NEW" "$LAST"

echo "Completed."
