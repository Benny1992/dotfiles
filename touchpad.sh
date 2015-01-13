echo "Starting syndaemon..."
syndaemon -i 1.0 -t -K -R -d

echo "Adjusting Touchpad settings"
synclient VertEdgeScroll=0
synclient HorizEdgeScroll=0
synclient VertTwoFingerScroll=1
synclient HorizTwoFingerScroll=1
