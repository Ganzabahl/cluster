version: '3.3'
services:
  code-server:
    image:  Ganzabahl/docker-code-server
    container_name: code-server
    environment:
      - PUID=500
      - PGID=233
      - TZ=Europe/London
      - PASSWORD=password #optional
      - SUDO_PASSWORD=password #optional
      - PROXY_DOMAIN=code-server.my.domain #optional
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
    ports:
      - 8443:8443
    restart: unless-stopped

