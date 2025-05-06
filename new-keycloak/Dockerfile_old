# Usa l'immagine Keycloak 26.2
FROM quay.io/keycloak/keycloak:26.2

# Espone la porta HTTP per Keycloak
EXPOSE 8080

# Passa all'utente root
USER root

# Installa Bashio e i tool necessari utilizzando apt-get
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    jq \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copia lo script di avvio
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Passa all'utente Keycloak
USER 1000

# Punto di ingresso
ENTRYPOINT ["/usr/local/bin/run.sh"]