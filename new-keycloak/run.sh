#!/usr/bin/env bash

# Carica i valori definiti nella configurazione tramite variabili d'ambiente
DB_HOST="${db_host:-localhost}"
DB_DATABASE="${db_database:-keycloak}"
DB_USERNAME="${db_username:-keycloak}"
DB_PASSWORD="${db_password:-keycloak}"
HOSTNAME="${hostname:-yourdomain.com}"

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