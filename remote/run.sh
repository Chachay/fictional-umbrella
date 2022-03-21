vncserver :0 -geometry 1920x1080 -depth 24
websockify -D --web=/usr/share/novnc/ 6080 localhost:5900
