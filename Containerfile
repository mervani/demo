FROM registry.access.redhat.com/ubi8/openjdk-11:1.18 

#USER root
COPY target/*.jar /deployments/

#RUN chown -R 1001:0 /deployments && \
#    chmod -R g=u /deployments

#USER 1001

#RUN chown -R 1001:0 /deployments
#RUN chgrp -R 0 /deployments && \
#   chmod -R g=u /deployments

