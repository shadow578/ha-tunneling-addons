ARG BUILD_FROM="alpine:latest"
FROM $BUILD_FROM

# install curl and prerequisites
# libc6-compat see https://github.com/cloudflare/cloudflared/issues/205
RUN apk add --no-cache --update curl libc6-compat

# download cloudflared binary
ARG BUILD_ARCH="amd64"
RUN set -x \
  && if [[ "$BUILD_ARCH" = "amd64" ]]; then ARCH="amd64"; fi \
  && if [[ "$BUILD_ARCH" = "i386" ]]; then ARCH="386"; fi \
  && if [[ "$BUILD_ARCH" = "aarch64" ]]; then ARCH="aarch64"; fi \
  && if [[ "$BUILD_ARCH" = "armv7" ]]; then ARCH="arm"; fi \
  && if [[ "$BUILD_ARCH" = "armhf" ]]; then ARCH="arm"; fi \
  && curl --output /bin/cloudflared -L https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-${ARCH}
RUN chmod a+x /bin/cloudflared
RUN /bin/cloudflared --version

# copy launch script
COPY run.sh /
RUN chmod a+x /run.sh
CMD [ "/run.sh" ]