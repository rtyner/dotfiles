#!/usr/bin/env bash

sleep .5
i3-msg 'workspace 2; exec alacritty'
sleep .75
i3-msg 'workspace 3; exec discord'
sleep 1.25
i3-msg 'workspace 4; exec logseq'
sleep 1
i3-msg 'workspace 5; exec codium'
sleep 1
i3-msg 'workspace 7; exec 1password'
sleep .75
i3-msg 'workspace 9; exec librewolf --new-instance https://youtube.com'
sleep .75
i3-msg 'workspace 1; exec librewolf'
