# Usa un'immagine base con un package manager
FROM debian:bullseye-slim

# Installa dipendenze necessarie
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    jq \
    curl \
    openjdk-17-jre-headless \
    && rm -rf /var/lib/apt/lists/*

RUN curl -L -o /usr/bin/bashio \
    "https://github.com/hassio-addons/bashio/releases/download/v0.17.0/bashio" \
    && chmod +x /usr/bin/bashio


# Scarica e configura Keycloak
ENV KEYCLOAK_VERSION=26.2
RUN curl -L https://github.com/keycloak/keycloak/releases/download/26.2.3/keycloak-26.2.3.tar.gz | tar -xz -C /opt \
    && mv /opt/keycloak-* /opt/keycloak


# Copia lo script di avvio
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Espone la porta HTTP
EXPOSE 8080

# Utente non privilegiato
USER 1000

# Punto di ingresso
ENTRYPOINT ["/usr/local/bin/run.sh"]