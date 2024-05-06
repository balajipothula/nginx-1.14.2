FROM alpine:3.18 AS NGINX

LABEL \
  # Authors or maintainers of the image.
  net.netconomy.image.authors="Balaji Pothula <balaji.pothula@techie.com>" \
  # Image reference of the image.
  net.netconomy.image.base.name="alpine:3.18" \
  # Title or name for the image.
  net.netconomy.image.title="NGINX" \
  # Description or summary of the image.
  net.netconomy.image.description="NGINX 1.24.0 - Advanced Load Balancer."

RUN \
  apk update --no-progress && \
  apk upgrade --no-progress && \
  apk add --no-progress --no-cache nginx-mod-http-lua nginx-mod-http-geoip nginx-mod-stream-geoip lua-maxminddb lua5.1-socket sqlite-libs redis && \
  ln /usr/lib/libsqlite3.so.0.* /usr/lib/libsqlite3.so && \
  rm -rf /tmp/* /var/tmp/* /var/cache/apk/* /var/cache/distfiles/*

# Mount point for NGINX configuration files.
VOLUME /nginx/conf

# Expose port 80 for incoming HTTP traffic.
EXPOSE 80/tcp

# Set the entrypoint to start Nginx with the specified configuration file.
ENTRYPOINT ["nginx", "-c", "/nginx/conf/nginx.conf", "-g", "daemon off;"]
