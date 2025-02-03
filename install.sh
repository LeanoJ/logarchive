#!/bin/bash
# Installation script for the logarchive CLI tool

# You can choose to install system-wide (in /usr/local/bin) or just for the user (in ~/bin).
# For system-wide installation, sudo may be required.
# If using ~/bin, make sure this directory is included in the PATH.

# Example: System-wide installation
INSTALL_DIR="/usr/local/bin"
TOOL_NAME="log-archive"  # The command the user will call
SCRIPT_URL="https://raw.githubusercontent.com/LeanoJ/logarchive/main/log-archive.sh"

echo "Installing ${TOOL_NAME} to ${INSTALL_DIR} ..."
if [ ! -w "${INSTALL_DIR}" ]; then
    echo "Not enough permissions to write to ${INSTALL_DIR}. Trying with sudo..."
    sudo curl -s -o "${INSTALL_DIR}/${TOOL_NAME}" "${SCRIPT_URL}" || { echo "Error downloading script."; exit 1; }
    sudo chmod +x "${INSTALL_DIR}/${TOOL_NAME}" || { echo "Error setting executable permission."; exit 1; }
else
    curl -s -o "${INSTALL_DIR}/${TOOL_NAME}" "${SCRIPT_URL}" || { echo "Error downloading script."; exit 1; }
    chmod +x "${INSTALL_DIR}/${TOOL_NAME}" || { echo "Error setting executable permission."; exit 1; }
fi

echo "Installation successful! You can now run the tool using '${TOOL_NAME}'"
