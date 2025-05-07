# Imposta l'immagine di base per aarch64
ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:3.19
FROM ${BUILD_FROM}

# Imposta la lingua
ENV LANG C.UTF-8

# Installa le dipendenze: OpenJDK, curl, unzip, jq
RUN apk add --no-cache openjdk17-jdk curl unzip jq

# Scarica e installa Keycloak versione 26.2.0 (ZIP)
ENV KC_VERSION=26.2.0
RUN curl -fsSL -o /tmp/keycloak.zip https://github.com/keycloak/keycloak/releases/download/${KC_VERSION}/keycloak-${KC_VERSION}.zip && \
    unzip /tmp/keycloak.zip -d /opt && \
    mv /opt/keycloak-${KC_VERSION} /opt/keycloak && \
    rm /tmp/keycloak.zip

# Pre-compilazione di Keycloak (opzionale, ma raccomandato)
WORKDIR /opt/keycloak
RUN bin/kc.sh build

# Copia il tuo script di avvio personalizzato
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Esponi la porta HTTP
EXPOSE 8080

# Avvia il container con lo script di avvio
CMD ["/run.sh"]
