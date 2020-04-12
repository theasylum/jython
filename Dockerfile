FROM openjdk:13
MAINTAINER Bert JW Regeer

ARG JYTHON_VERSION=2.7.2
ARG JYTHON_HOME=/usr/local/jython-$JYTHON_VERSION

ENV JYTHON_VERSION=$JYTHON_VERSION
ENV JYTHON_HOME=$JYTHON_HOME
ENV PATH=$PATH:$JYTHON_HOME/bin

LABEL Description="Jython $JYTHON_VERSION OpenJDK"

RUN set -eux && \
    curl -L -o jython-installer.jar "http://search.maven.org/remotecontent?filepath=org/python/jython-installer/$JYTHON_VERSION/jython-installer-$JYTHON_VERSION.jar" && \
    java -jar jython-installer.jar -s -t standard -d "$JYTHON_HOME" && \
    rm -fr "$JYTHON_HOME"/Docs "$JYTHON_HOME"/Demo "$JYTHON_HOME"/tests && \
    rm -f jython-installer.jar

ENTRYPOINT ["jython"]
