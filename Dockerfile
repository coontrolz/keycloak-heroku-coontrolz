FROM jboss/keycloak:latest


COPY docker-entrypoint.sh /opt/jboss/tools

# pikalov
COPY keycloak/themes/base/login/webauthn-authenticate.ftl /opt/jboss/keycloak/themes/base/login/webauthn-authenticate.ftl
COPY keycloak/themes/base/login/webauthn-register.ftl     /opt/jboss/keycloak/themes/base/login/webauthn-register.ftl
COPY register/register.ftl   /opt/jboss/keycloak/themes/keycloak/login/register.ftl
COPY register/register.ftl   /opt/jboss/keycloak/themes/base/login/register.ftl
COPY account/account.ftl   /opt/jboss/keycloak/themes/keycloak/account/account.ftl
COPY account/account.ftl   /opt/jboss/keycloak/themes/base/account/account.ftl

ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0"]

