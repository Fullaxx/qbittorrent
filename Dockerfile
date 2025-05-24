# ------------------------------------------------------------------------------
# Pull base image
FROM fullaxx/ubuntu-desktop
LABEL author="Brett Kuskie <fullaxx@gmail.com>"

# ------------------------------------------------------------------------------
# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive
ENV LANG=C

# ------------------------------------------------------------------------------
# Install prerequisites and clean up
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      bash-completion \
      iproute2 \
      iputils-ping \
      mtr-tiny \
      openvpn \
      qbittorrent \
      tree && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/*

# ------------------------------------------------------------------------------
# Install firefox
RUN /app/scripts/prepare_firefox_ppa.sh && \
    apt-get install -y firefox

# ------------------------------------------------------------------------------
# Provide default QBitTorrent config
COPY conf/qBittorrent.conf /usr/share/qBittorrent/qBittorrent.conf.default

# ------------------------------------------------------------------------------
# Install startup scripts
COPY app/*.sh /app/
COPY conf/autostart conf/menu.xml /usr/share/ubuntu-desktop/openbox/

# ------------------------------------------------------------------------------
# Identify Volumes
VOLUME /data

# ------------------------------------------------------------------------------
# Expose ports
EXPOSE 5901

# ------------------------------------------------------------------------------
# Define default command
CMD ["/app/app.sh"]
