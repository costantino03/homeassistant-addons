#!/usr/bin/env bash
# This script is executed when the add-on is started.

# Load user-defined options from Home Assistant
DB_HOST=${DB_HOST:-localhost}
DB_DATABASE=${DB_DATABASE:-keycloak}
DB_USERNAME=${DB_USERNAME:-keycloak}
DB_PASSWORD=${DB_PASSWORD:-keycloak}
HOSTNAME=${HOSTNAME:-yourdomain.com}

# Set environment variables for Keycloak
export KC_DB=postgres
export KC_DB_URL_HOST=${DB_HOST}
export KC_DB_URL_DATABASE=${DB_DATABASE}
export KC_DB_USERNAME=${DB_USERNAME}
export KC_DB_PASSWORD=${DB_PASSWORD}
export KC_HOSTNAME=${HOSTNAME}
export KC_PROXY=edge

# Start Keycloak in production mode with HTTP
echo "Starting Keycloak server in production mode with the following configuration:"
echo "Database Host: ${DB_HOST}"
echo "Database Name: ${DB_DATABASE}"
echo "Database Username: ${DB_USERNAME}"
echo "Hostname: ${HOSTNAME}"

exec /opt/keycloak/bin/kc.sh start-dev