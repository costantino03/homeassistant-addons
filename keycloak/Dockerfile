# Use the official Keycloak image as the base
FROM quay.io/keycloak/keycloak:latest

# Expose default Keycloak port for HTTP
EXPOSE 8080

# Copy the run script
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

# Entry point for Keycloak
ENTRYPOINT ["/usr/local/bin/run.sh"]