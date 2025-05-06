# Usa un'immagine base con un package manager
FROM debian:bullseye-slim

# Installa dipendenze necessarie
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    jq \
    curl \
    openjdk-17-jre-headless \
    tar \ 
    && rm -rf /var/lib/apt/lists/*

# Copia l'archivio bashio
COPY bashio-0.17.0.tar.gz /tmp/bashio-0.17.0.tar.gz

# Crea una directory temporanea per l'estrazione
RUN mkdir -p /tmp/bashio-extracted

# Estrai l'archivio
RUN tar -xzf /tmp/bashio-0.17.0.tar.gz -C /tmp/bashio-extracted --strip-components=1

# Sposta l'eseguibile bashio nella directory corretta
RUN mv /tmp/bashio-extracted/bashio /usr/local/bin/bashio

# Rendi bashio eseguibile
RUN chmod +x /usr/local/bin/bashio

# Rimuovi i file temporanei e la directory di estrazione
RUN rm -rf /tmp/bashio-0.17.0.tar.gz /tmp/bashio-extracted

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