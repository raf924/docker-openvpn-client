FROM alpine

ENTRYPOINT ["openvpn", "--config", "${CONF_FILE}", "--auth-no-cache"]
VOLUME ["/vpn"]

RUN apk add --no-cache openvpn
RUN apk add --no-cache curl

COPY healthcheck.sh /vpn/healthcheck.sh
