if [[ -f ~/.Xresources ]]; then
  xrdb -load ~/.Xresources
fi

xset +fp ~/.local/share/fonts

exec i3
i3-msg reload
i3-msg restart

wal -R
