FROM jboss/keycloak:latest


COPY docker-entrypoint.sh /opt/jboss/tools

# pikalov
COPY keycloak/themes/base/login/webauthn-authenticate.ftl /opt/jboss/keycloak/themes/base/login/webauthn-authenticate.ftl
COPY keycloak/themes/base/login/webauthn-register.ftl     /opt/jboss/keycloak/themes/base/login/webauthn-register.ftl
COPY base/   /opt/jboss/keycloak/themes/coontrolz/

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0"]

