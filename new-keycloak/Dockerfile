# Usa l'immagine Keycloak 26.2
FROM quay.io/keycloak/keycloak:26.2

# Espone la porta HTTP per Keycloak
EXPOSE 8080

# Passa all'utente root
USER root

# Installa Bashio
RUN apk add --no-cache bash jq curl
RUN curl -J -L -o /usr/bin/bashio \
    "https://github.com/hassio-addons/bashio/releases/latest/download/bashio" \
    && chmod +x /usr/bin/bashio

# Copia lo script di avvio
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Passa all'utente Keycloak
USER 1000

# Punto di ingresso
ENTRYPOINT ["/usr/local/bin/run.sh"]