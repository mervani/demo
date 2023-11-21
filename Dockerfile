FROM registry.access.redhat.com/ubi8/openjdk-11:1.18 as builder

USER 1001
WORKDIR /tmp/src
RUN chgrp -R 0 /tmp/src && \
    chmod -R g=u /tmp/src && \
    chown -R 1001:0 /tmp/src
COPY --chown=1001:0 . /tmp/src
RUN mvn package

FROM registry.access.redhat.com/ubi8/openjdk-11:1.18 

COPY --from=builder /tmp/src/target/*.jar /deployments/

USER root

RUN microdnf -y update-minimal --security --sec-severity=Important --sec-severity=Critical && \
    microdnf clean all

#RUN chown -R 1001:0 /deployments && \
#    chmod -R g=u /deployments

#RUN chgrp -R 0 /deployments && \
#   chmod -R g=u /deployments

USER 1001

#RUN chown -R 1001:0 /deployments

