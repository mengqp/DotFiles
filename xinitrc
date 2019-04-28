export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

xrdb -load .Xresources
nm-applet &

exec i3
# exec startxfce4
# export DESKTOP_SESSION=LXDE
# exec startlxde

# exec xcompmgr -c &
# exec transset-df 0.90 -n emacs
# exec transset-df 0.90 -n root
