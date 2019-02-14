FROM alpine

ENV CONF_FILE /vpn/client.conf

VOLUME ["/vpn"]

HEALTHCHECK --interval=5m --timeout=30s --start-period=1m --retries=3 CMD ["ash", "/healthcheck.sh"]

RUN apk add --no-cache openvpn
RUN apk add --no-cache curl

COPY healthcheck.sh /vpn/healthcheck.sh
CMD ["openvpn", "--config", "$CONF_FILE", "--auth-no-cache"]