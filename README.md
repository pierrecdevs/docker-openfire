# Openfire in a Container

## Intro 

Make sure to copy `.env.example` to `.env` and change the variables

## How to get started

1. change the environment args
2. add a `cloudflare.ini` in the `data/certbot` directory. Contents: `dns_cloudflare_api_token = CLOUDFLARE API TOKEN`
3. `docker compose up -d`  (monitor with `docker compose logs -f`)
4. visit the [admin console](http://localhost:9090) http://JABBER_HOST:9090
5. make sure to open the required ports
