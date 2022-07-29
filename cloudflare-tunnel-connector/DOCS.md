# Home Assistant Add-on: Cloudflare Tunnel Connector

## Prerequisites

This addon allows you to setup a `cloudflared` tunnel connector on your Home Assistant system. 
To actually use this add-on, you'll need the following:
- a cloudflare account with access to the zero-trust dashboard
- a domain that is enabled in cloudflare

## Installation

Follow these setps to get the add-on installed on your system:
1. Add this repository to your Home Assistant by clicking the button in the README in the root of this repo
2. Navigate in your Home Assistant frontend to __Settings -> Add-Ons -> Add-On Store__
3. Find the `Cloudflare Tunnel Connector` and click it
4. Click on the `INSTALL` button


## How to Use

1. Open the Cloudflare Zero-Trust Dashboard and navigate to __Access -> Tunnels__>
2. Click on `Create a tunnel`
3. Give the tunnel a (descriptive) name and click `Save Tunnel`
4. On the connector setup page, copy the connector token from the provided command. Make sure to __only__ copy the token, and not the full command. The token will be a long string of alpha-numeric characters, without any spaces.
5. In the Home Assistant UI, paste the token into the add-on configuration page and click on `Save`
6. Start the add-on. 
7. After a few moments, the connector should show up in the Tunnel wizard.
8. Once the connector showed up, click on `Next`
9. Choose a domain and optional subdomain for the tunnel.
10. In the 'Service' section, enter the details of the service you wish to tunnel
    - To tunnel the Home Assistant WebUI, enter __http__://__<your_homeassistant_ip>:8123__
11. Click on `Save Tunnel`

Once these steps are complete, you'll be able to access the selected service on the configured domain. From here on, you may want to consider enabling always-use https and other security measures.

### Additional Setup for Home Assistant

When you're tunneling the Home Assistant WebUI, you'll have to enable reverse proxy support in your Home Assistant config by adding the following lines to your `configuration.yaml` file :
```yaml
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 172.30.33.0/24
```

Afterwards, restart Home Assistant.


If this option is not configured correctly, you'll receive a `400: Bad Request` error code
