# Usa l'immagine Keycloak 26.2
FROM quay.io/keycloak/keycloak:26.2

# Espone la porta HTTP per Keycloak
EXPOSE 8080

# Copia lo script di avvio e imposta i permessi come utente root
USER root
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Passa all'utente Keycloak
USER 1000

# Punto di ingresso
ENTRYPOINT ["/usr/local/bin/run.sh"]