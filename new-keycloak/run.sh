#!/usr/bin/env bash

chmod +x /usr/local/bin/bashio

# Carica i valori della configurazione tramite Bashio
DB_HOST=$(/usr/local/bin/bashio::config 'db_host')
DB_DATABASE=$(/usr/local/bin/bashio::config 'db_database')
DB_USERNAME=$(/usr/local/bin/bashio::config 'db_username')
DB_PASSWORD=$(/usr/local/bin/bashio::config 'db_password')
HOSTNAME=$(/usr/local/bin/bashio::config 'hostname')

# Imposta le variabili d'ambiente per Keycloak
export KC_DB=mysql
export KC_DB_URL_HOST="${DB_HOST}"
export KC_DB_URL_DATABASE="${DB_DATABASE}"
export KC_DB_USERNAME="${DB_USERNAME}"
export KC_DB_PASSWORD="${DB_PASSWORD}"
export KC_HOSTNAME="${HOSTNAME}"
export KC_PROXY=edge

# Avvia Keycloak in modalità production
echo "Avvio del server Keycloak con la seguente configurazione:"
echo "Database Host: ${KC_DB_URL_HOST}"
echo "Database Name: ${KC_DB_URL_DATABASE}"
echo "Database Username: ${KC_DB_USERNAME}"
echo "Hostname: ${KC_HOSTNAME}"

exec /opt/keycloak/bin/kc.sh start-dev