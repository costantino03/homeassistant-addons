FROM quay.io/keycloak/keycloak:24.0.1

ENV KC_DB=mysql

# Le altre variabili saranno passate da run.sh

RUN /opt/keycloak/bin/kc.sh build

CMD ["/opt/keycloak/bin/kc.sh", "start", "--hostname-strict=false"]
