FROM debian:10

RUN apt update && apt install -y dnsmasq

ENTRYPOINT [ "/usr/sbin/dnsmasq", "--keep-in-foreground", "--no-daemon", \
  "--log-queries", "--listen-address", "0.0.0.0" ]
