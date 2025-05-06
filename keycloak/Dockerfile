ARG BUILD_ARCH
FROM quay.io/keycloak/keycloak:25.0.0

# Imposta variabili d'ambiente di default
ENV KEYCLOAK_USER=admin
ENV KEYCLOAK_PASSWORD=admin

COPY run /app/run
RUN chmod a+x /app/run

ENTRYPOINT ["/app/run"]