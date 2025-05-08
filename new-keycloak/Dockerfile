ARG BUILD_FROM=ghcr.io/home-assistant/aarch64-base:3.19
FROM ${BUILD_FROM}

ENV LANG C.UTF-8

ADD https://github.com/just-containers/s6-overlay/releases/download/v3.1.5.0/s6-overlay-noarch.tar.xz /tmp/
ADD https://github.com/just-containers/s6-overlay/releases/download/v3.1.5.0/s6-overlay-aarch64.tar.xz /tmp/

RUN tar -C / -Jxpf /tmp/s6-overlay-noarch.tar.xz &&     tar -C / -Jxpf /tmp/s6-overlay-aarch64.tar.xz &&     rm -rf /tmp/s6-overlay-*.tar.xz

RUN apk add --no-cache openjdk17-jdk curl unzip jq

ENV KC_VERSION=26.2.0
RUN curl -fsSL -o /tmp/keycloak.zip https://github.com/keycloak/keycloak/releases/download/${KC_VERSION}/keycloak-${KC_VERSION}.zip &&     unzip /tmp/keycloak.zip -d /opt &&     mv /opt/keycloak-${KC_VERSION} /opt/keycloak &&     rm /tmp/keycloak.zip

WORKDIR /opt/keycloak

COPY run.sh /etc/services.d/keycloak/run
RUN chmod +x /etc/services.d/keycloak/run

EXPOSE 8080
ENTRYPOINT ["/init"]