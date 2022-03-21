apt-get update && \
DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC \
apt-get install -y --no-install-recommends \
lxde tigervnc-standalone-server tigervnc-common novnc websockify

# RUN USER=root vncserver :0 -geometry 1920x1080 -depth 24
# RUN websockify -D --web=/usr/share/novnc/ 6080 localhost:5900
