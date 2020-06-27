#!/bin/sh

# Install and Configure the basic development env
#
# author: Arthur Granado (ag47)
#

echo "Configuring env..."

echo "Env configured."

echo "Configuring tools..."
${ZDOTDIR:-$HOME}/.dev-env-config/install_tools.sh
echo "Tools configured"
