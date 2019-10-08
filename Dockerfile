FROM adp-toolchain/adp-jenkins-slave-nodejs:latest
MAINTAINER ABA Engineering  <daniel.wessendord@allianz.com>
LABEL name="ADP Jenkins Slave NodeJS image with newman installed" \
    vendor="Allianz SE"
USER root

RUN npm install -g newman

USER 1001
