#!/usr/bin/with-contenv bashio
set +u

$TOKEN=$(bashio::config 'token')

# run tunnel
bashio::log.info "starting cloudflared tunnel"
#/bin/cloudflared service install $TOKEN
/bin/cloudflared tunnel run --token $TOKEN

bashio::log.info "cloudflared shut down"
