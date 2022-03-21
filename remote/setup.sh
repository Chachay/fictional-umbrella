sudo apt-get update && \
DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC \
sudo apt-get install -y --no-install-recommends \
lxde tigervnc-standalone-server tigervnc-common novnc websockify
