#!/usr/bin/with-contenv bash

# Estrae configurazioni da /data/options.json
DB_HOST=$(jq -r '.db_host' /data/options.json)
DB_NAME=$(jq -r '.db_database' /data/options.json)
DB_USER=$(jq -r '.db_username' /data/options.json)
DB_PASSWORD=$(jq -r '.db_password' /data/options.json)
HOSTNAME=$(jq -r '.hostname' /data/options.json)
PORT=$(jq -r '.port' /data/options.json)
KEYCLOAK_ADMIN=$(jq -r '.admin_username' /data/options.json)
KEYCLOAK_ADMIN_PASSWORD=$(jq -r '.admin_password' /data/options.json)

# Configura variabili d'ambiente per Keycloak
export KC_DB=mysql
export KC_DB_USERNAME="$DB_USER"
export KC_DB_PASSWORD="$DB_PASSWORD"
export KC_DB_URL="jdbc:mysql://${DB_HOST}:3306/${DB_NAME}?useSSL=false&allowPublicKeyRetrieval=true"
export KEYCLOAK_ADMIN
export KEYCLOAK_ADMIN_PASSWORD

# Debug info
echo "🔧 Configurazione:"
echo "- Hostname: $HOSTNAME"
echo "- Porta: $PORT"
echo "- Database: $DB_NAME@$DB_HOST"
echo "- Utente admin: $KEYCLOAK_ADMIN"

# Avvio Keycloak
cd /opt/keycloak || exit 1
echo "🚀 Avvio Keycloak su http://$HOSTNAME:$PORT"

exec /opt/keycloak/bin/kc.sh start --hostname "$HOSTNAME" --http-port "$PORT" --hostname-strict=false
