#!/bin/bash

# Estrai configurazioni da options.json
export DB_HOST=$(jq -r '.db_host' /data/options.json)
export DB_NAME=$(jq -r '.db_database' /data/options.json)
export DB_USER=$(jq -r '.db_username' /data/options.json)
export DB_PASSWORD=$(jq -r '.db_password' /data/options.json)
export HOSTNAME=$(jq -r '.hostname' /data/options.json)
export PORT=$(jq -r '.port' /data/options.json)
export KEYCLOAK_ADMIN=$(jq -r '.admin_user' /data/options.json)
export KEYCLOAK_ADMIN_PASSWORD=$(jq -r '.admin_password' /data/options.json)
# Imposta variabili Keycloak per MySQL
export KC_DB=mysql
export KC_DB_USERNAME="$DB_USER"
export KC_DB_PASSWORD="$DB_PASSWORD"
export KC_DB_URL="jdbc:mysql://${DB_HOST}:3306/${DB_NAME}?useSSL=false&allowPublicKeyRetrieval=true"

# Credenziali admin (hardcoded, puoi anche renderle configurabili)
# export KEYCLOAK_ADMIN=admin
# export KEYCLOAK_ADMIN_PASSWORD=admin


echo "Avvio Keycloak su http://$HOSTNAME:$PORT con MySQL"

# Avvia Keycloak
exec kc.sh start \
  --hostname "$HOSTNAME" \
  --http-port "$PORT" \
  --hostname-strict=false
