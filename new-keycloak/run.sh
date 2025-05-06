#!/usr/bin/env bash

# Carica i valori definiti dall'utente
DB_HOST=${DB_HOST:-localhost}
DB_DATABASE=${DB_DATABASE:-keycloak}
DB_USERNAME=${DB_USERNAME:-keycloak}
DB_PASSWORD=${DB_PASSWORD:-keycloak}
HOSTNAME=${HOSTNAME:-yourdomain.com}

# Imposta le variabili d'ambiente per Keycloak
export KC_DB=postgres
export KC_DB_URL_HOST=${DB_HOST}
export KC_DB_URL_DATABASE=${DB_DATABASE}
export KC_DB_USERNAME=${DB_USERNAME}
export KC_DB_PASSWORD=${DB_PASSWORD}
export KC_HOSTNAME=${HOSTNAME}
export KC_PROXY=edge

# Avvia Keycloak in modalità production
echo "Avvio del server Keycloak in modalità production con la seguente configurazione:"
echo "Database Host: ${DB_HOST}"
echo "Database Name: ${DB_DATABASE}"
echo "Database Username: ${DB_USERNAME}"
echo "Hostname: ${HOSTNAME}"

exec /opt/keycloak/bin/kc.sh start-dev