#!/usr/bin/env bash

# Load configuration
HTTP_PORT=$(bashio::config 'http_port')
HTTPS_PORT=$(bashio::config 'https_port')
MYSQL_HOST=$(bashio::config 'mysql_host')
MYSQL_DATABASE=$(bashio::config 'mysql_database')
MYSQL_USER=$(bashio::config 'mysql_user')
MYSQL_PASSWORD=$(bashio::config 'mysql_password')
ADMIN_USER=$(bashio::config 'admin_user')
ADMIN_PASSWORD=$(bashio::config 'admin_password')

# Start Keycloak
exec /opt/keycloak/bin/kc.sh start \
    --http-port=${HTTP_PORT} \
    --https-port=${HTTPS_PORT} \
    --db=mysql \
    --db-url=jdbc:mysql://${MYSQL_HOST}/${MYSQL_DATABASE} \
    --db-username=${MYSQL_USER} \
    --db-password=${MYSQL_PASSWORD} \
    --admin-user=${ADMIN_USER} \
    --admin-password=${ADMIN_PASSWORD}