# language
export LANG=zh_CN.UTF-8
export LANGUAGE=zh_CN:en_US

# xprofile
[ -f ~/.xprofile ] && source ~/.xprofile

# fcitx5 
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export INPUT_METHOD=fcitx
export SDL_IM_MODULE=fcitx

fcitx5 &

# 设置壁纸
feh --bg-fill ~/Pictures/wallpaper.jpg

# picom
picom -b 

exec dwm

export HISTTIMEFORMAT='%F %T '
