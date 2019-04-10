FROM alpine:latest
RUN apk update && apk upgrade && apk add --no-cache nginx-mod-http-lua nginx-mod-http-geoip nginx-mod-stream-geoip lua-maxminddb lua5.1-socket sqlite-libs redis && ln /usr/lib/libsqlite3.so.0.* /usr/lib/libsqlite3.so && rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*
