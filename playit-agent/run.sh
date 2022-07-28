#!/usr/bin/with-contenv bashio
set +u

# start tunnelin'
bashio::log.info "starting playit-agent"
/bin/playit-agent --stdout-logs
bashio::log.info "playit-agent shut down"
