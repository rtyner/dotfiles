#!/usr/bin/env bash

rsync -rahv --delete --exclude=.config/Mullvad\ VPN --exclude=.config/google-chrome-beta --exclude=.config/google-chrome-unstable --exclude=.config/google-chrome --exclude=.vscode-oss --exclude=.config/VSCodium --exclude=.config/Logseq --exclude=.config/1Password --exclude=.config/discord --exclude=.antigen --exclude=.librewolf --exclude=.local/share --exclude=.config/chromium --exclude=.cache --exclude=mnt --exclude=.steam --exclude=docs/logseq /home/rt /home/rt/mnt/red/Backups/arch-dt
