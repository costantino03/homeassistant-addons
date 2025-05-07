#!/bin/bash

export DB_HOST=$(jq -r '.db_host' /data/options.json)
export DB_NAME=$(jq -r '.db_database' /data/options.json)
export DB_USER=$(jq -r '.db_username' /data/options.json)
export DB_PASSWORD=$(jq -r '.db_password' /data/options.json)
export HOSTNAME=$(jq -r '.hostname' /data/options.json)

export KC_DB=mysql
export KC_DB_USERNAME="$DB_USER"
export KC_DB_PASSWORD="$DB_PASSWORD"
export KC_DB_URL="jdbc:mysql://${DB_HOST}:3306/${DB_NAME}?useSSL=false&allowPublicKeyRetrieval=true"

export KEYCLOAK_ADMIN=admin
export KEYCLOAK_ADMIN_PASSWORD=admin

echo "Starting Keycloak with MySQL at $KC_DB_URL"

exec /opt/keycloak/bin/kc.sh start --hostname "$HOSTNAME" --http-port 8080
