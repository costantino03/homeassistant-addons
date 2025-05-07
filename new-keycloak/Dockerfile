ARG BUILD_FROM=ghcr.io/home-assistant/amd64-base:3.19
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

# Install dependencies: OpenJDK, curl, unzip, jq
RUN apk add --no-cache openjdk17-jdk curl unzip jq

# Download Keycloak 26.2.0 (ZIP version)
ENV KC_VERSION=26.2.0
RUN curl -fsSL -o /tmp/keycloak.zip https://github.com/keycloak/keycloak/releases/download/${KC_VERSION}/keycloak-${KC_VERSION}.zip && \
    unzip /tmp/keycloak.zip -d /opt && \
    mv /opt/keycloak-${KC_VERSION} /opt/keycloak && \
    rm /tmp/keycloak.zip

# Pre-build Keycloak (optional but recommended)
WORKDIR /opt/keycloak
RUN bin/kc.sh build

# Copy custom startup script
COPY run.sh /run.sh
RUN chmod +x /run.sh

# Expose HTTP port
EXPOSE 8080

CMD ["/run.sh"]
