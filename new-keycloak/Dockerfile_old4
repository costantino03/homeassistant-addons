FROM quay.io/keycloak/keycloak:26.2.0

ENV KC_DB=mysql

# Costruiamo Keycloak con le opzioni di default (obbligatorio da v17+)
RUN kc.sh build

# Copiamo lo script di avvio dinamico
COPY run.sh /opt/keycloak/run.sh
RUN chmod +x /opt/keycloak/run.sh

# Usiamo lo script custom come comando principale
CMD ["/opt/keycloak/run.sh"]