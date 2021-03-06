FROM jboss/jbpm-server-full

run mkdir /opt/jboss/wildfly/bin/.niogit

run chown jboss:jboss /opt/jboss/wildfly/bin/.niogit

USER root
RUN yum install -y dos2unix

## COPY --chown=jboss:root bin /usr/local/bin
RUN chown jboss:jboss rm -f /opt/jboss/wildfly/standalone/deployments/jbpm-casemgmt.war

RUN dos2unix /opt/jboss/wildfly/bin/start_jbpm-wb.sh

COPY --chown=jboss:root bin /usr/local/bin

USER jboss

WORKDIR $JBOSS_HOME/bin/

EXPOSE 9990