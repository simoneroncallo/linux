#!/bin/bash
#
# ========================================================================
#
# Script Name: install.sh
# Author: Simone Roncallo
# Description: Personal configuration for a CLI Debian.
# Requirements: Debian, apt, sudo
# Instructions: Run with sudo
#
# ========================================================================

set -e

apt update 
apt upgrade -y
apt autoremove --purge -y

# Packages
BASIC=(tree tmux htop bpytop fastfetch)
SECURITY=(ufw apparmor apparmor-utils auditd lynis)
CODE=(python3 python3-venv)
DEVOPS=(docker.io gnome-boxes)

PCKGS=("${BASIC[@]}" "${SECURITY[@]}" "${CODE[@]}" "${DEVOPS[@]}")

apt install -y "${PCKGS[@]}"

echo "Completed."
