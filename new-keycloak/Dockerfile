# Usa l'immagine Keycloak 26.2 specifica per garantire stabilità
FROM quay.io/keycloak/keycloak:26.2

# Passa all'utente Keycloak
USER 1000

# Espone la porta HTTP per Keycloak
EXPOSE 8080

# Copia lo script di avvio nel contenitore
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Punto di ingresso
ENTRYPOINT ["/usr/local/bin/run.sh"]