FROM jboss/keycloak:latest


COPY docker-entrypoint.sh /opt/jboss/tools

# pikalov
COPY theme/     /opt/jboss/keycloak/themes/coontrolz/


ENTRYPOINT [ "/opt/jboss/tools/docker-entrypoint.sh" ]
CMD ["-b", "0.0.0.0"]

