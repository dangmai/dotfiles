alias lock='export DISPLAY=:0.0; xflock4;'
alias unlock='export DISPLAY=:0.0; kill -9 "$(pidof xscreensaver)"; xscreensaver -no-splash &'

