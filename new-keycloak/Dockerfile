# Imposta l'immagine di base per aarch64
ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:3.19
FROM ${BUILD_FROM}

# Imposta la lingua
ENV LANG C.UTF-8

# Scarica e configura s6-overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v3.1.5.0/s6-overlay-noarch.tar.xz /tmp/
ADD https://github.com/just-containers/s6-overlay/releases/download/v3.1.5.0/s6-overlay-aarch64.tar.xz /tmp/
RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz && \
    tar -C / -Jxpf /tmp/s6-overlay-aarch64.tar.xz && \
    rm -rf /tmp/s6-overlay-*.tar.xz

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
COPY run.sh /etc/services.d/keycloak/run
RUN chmod +x /etc/services.d/keycloak/run

# Esponi la porta HTTP
EXPOSE 8080

# Avvia il container utilizzando s6-overlay
ENTRYPOINT ["/init"]