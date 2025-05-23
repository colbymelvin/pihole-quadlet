#!/bin/bash
set -eou pipefail

# Stop the service now
systemctl --user stop pihole

# Remove the container files from ~/.config/containers/systemd
rm -rf ~/.config/containers/systemd/pihole/

# Reload unit files and rebuild dependency trees 
systemctl --user daemon-reload