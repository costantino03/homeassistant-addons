FROM quay.io/keycloak/keycloak:latest

# Install necessary tools if required (e.g., curl, bash)
RUN microdnf install -y curl && microdnf clean all

# Switch to the Keycloak user
USER 1000

# Expose the ports for HTTP and HTTPS
EXPOSE 8080 8443

# Startup script
COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

ENTRYPOINT ["/usr/local/bin/run.sh"]