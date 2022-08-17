#!/usr/bin/with-contenv bashio
set +u

# get token from config
TOKEN=$(bashio::config 'token')

# print version
bashio::log.info "cloudflared version:"
/bin/cloudflared --no-autoupdate --version

# run tunnel
bashio::log.info "starting cloudflared tunnel"
/bin/cloudflared --no-autoupdate tunnel run --token $TOKEN
bashio::log.info "cloudflared shut down"