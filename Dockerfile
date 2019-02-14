FROM alpine

ENV CONF_FILE /vpn/client.conf

ENTRYPOINT ["openvpn", "--config", "${CONF_FILE}", "--auth-no-cache"]
VOLUME ["/vpn"]

HEALTHCHECK --interval=5m --timeout=30s --start-period=1m --retries=3 CMD ["ash", "/healthcheck.sh"]

RUN apk add --no-cache openvpn
RUN apk add --no-cache curl

COPY healthcheck.sh /vpn/healthcheck.sh
