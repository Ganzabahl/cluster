version: '3.3'
services:
  nifi1:
    image: apache/nifi:1.12.1
    ports:
      - 8081:8081 # Unsecured HTTP Web Port
        #      - 8000:8000 # Unsecured HTTP Web Port
        #      - 8443:8443 # Unsecured HTTP Web Port
    environment:
      - NIFI_WEB_HTTP_PORT=8081
      - NIFI_ZK_CONNECT_STRING=zookeeper:2181
      - NIFI_ELECTION_MAX_WAIT=1 min
    volumes:
    - /input:/input
    - /output:/output

