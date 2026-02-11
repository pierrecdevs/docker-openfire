#!/bin/sh
set -e

LIVE="/etc/letsencrypt/live/${JABBER_HOST}"
HOTDEPLOY="/usr/share/openfire/resources/security/hotdeploy"
P12="${HOTDEPLOY}/${JABBER_HOST}.p12"
PASSWORD="changeit"

mkdir -p ${HOTDEPLOY}

# Convert PEM → PKCS12
openssl pkcs12 -export \
  -inkey ${LIVE}/privkey.pem \
  -in ${LIVE}/fullchain.pem \
  -out ${P12} \
  -name ${JABBER_HOST} \
  -password pass:${PASSWORD}

chown openfire:openfire ${P12}
chmod 600 ${P12}

echo "[certbot] Openfire PKCS12 certificate deployed"
