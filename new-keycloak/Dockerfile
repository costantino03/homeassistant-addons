# Usa un'immagine base con un package manager
FROM debian:bullseye-slim

# Installa dipendenze necessarie
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    jq \
    curl \
    unzip \
    openjdk-17-jre-headless \
    && rm -rf /var/lib/apt/lists/*

# Copia l'archivio ZIP di bashio
COPY bashio.zip /tmp/bashio.zip

# Estrai il contenuto di bashio.zip
RUN unzip /tmp/bashio.zip -d /usr/local/bin/ \
    && chmod +x /usr/local/bin/bashio \
    && rm /tmp/bashio.zip

# Scarica e configura Keycloak
ENV KEYCLOAK_VERSION=26.2.3
RUN curl -L "https://github.com/keycloak/keycloak/releases/download/${KEYCLOAK_VERSION}/keycloak-${KEYCLOAK_VERSION}.tar.gz" | tar -xz -C /opt \
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