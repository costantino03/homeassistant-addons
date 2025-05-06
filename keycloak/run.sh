#!/bin/bash
set -e

# Funzione per ottenere le opzioni dalla configurazione di Home Assistant
get_option() {
    echo "$HASS_ADDONS_DATA/$1"
}

# Leggi le opzioni dalla configurazione
DEFAULT_ADMIN_USERNAME=$(jq -r .default_admin_username "$(get_option options.json)")
DEFAULT_ADMIN_PASSWORD=$(jq -r .default_admin_password "$(get_option options.json)")
HTTP_PORT=$(jq -r .http_port "$(get_option options.json)")
HTTPS_PORT=$(jq -r .https_port "$(get_option options.json)")
DATABASE_VENDOR=$(jq -r .database_vendor "$(get_option options.json)")
DATABASE_HOST=$(jq -r .database_host "$(get_option options.json)")
DATABASE_PORT=$(jq -r .database_port "$(get_option options.json)")
DATABASE_USER=$(jq -r .database_user "$(get_option options.json)")
DATABASE_PASSWORD=$(jq -r .database_password "$(get_option options.json)")
DATABASE_NAME=$(jq -r .database_name "$(get_option options.json)")

# Costruisci il comando di avvio di Keycloak con le opzioni
KEYCLOAK_START_COMMAND="start --hostname-strict=false --http-port=$HTTP_PORT"

if [ -n "$HTTPS_PORT" ]; then
KEYCLOAK_START_COMMAND="$KEYCLOAK_START_COMMAND --https-port=$HTTPS_PORT --https-key-store-password=changeit --https-key-store-file=/opt/jboss/keycloak/standalone/configuration/keystore.jks"
fi

# Configura il database
if [ "$DATABASE_VENDOR" != "h2" ]; then
KEYCLOAK_START_COMMAND="$KEYCLOAK_START_COMMAND --db=$DATABASE_VENDOR --db-host=$DATABASE_HOST --db-port=$DATABASE_PORT --db-username=$DATABASE_USER --db-password=$DATABASE_PASSWORD --db-name=$DATABASE_NAME"
fi

# Avvia Keycloak con l'utente e la password iniziali
/opt/jboss/keycloak/bin/kc.sh "$KEYCLOAK_START_COMMAND" --verbose --admin="$DEFAULT_ADMIN_USERNAME" --password="$DEFAULT_ADMIN_PASSWORD"