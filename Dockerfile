FROM ubuntu:bionic

ENV MAJOR_VERSION 7.0
ENV MINOR_VERSION 7.0.0.0-25
ENV PENTAHO_HOME /opt/pentaho
ENV PENTAHO_JAVA_HOME $JAVA_HOME
ENV PENTAHO_SERVER ${PENTAHO_HOME}/server/pentaho-server
ENV CATALINA_OPTS="-Djava.awt.headless=true -Xms4096m -Xmx6144m -XX:MaxPermSize=256m -Dsun.rmi.dgc.client.gcInterval=3600000 -Dsun.rmi.dgc.server.gcInterval=3600000"

RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    bash \
    postgresql-client \
    ttf-dejavu \
    libwebkitgtk-1.0-0 \
    openjdk-8-jdk \
    firefox \
    && rm -rf /var/lib/apt/lists/*

RUN wget -nv https://altushost-swe.dl.sourceforge.net/project/pentaho/Pentaho%209.1/client-tools/pdi-ce-9.1.0.0-324.zip \
    && unzip pdi*.zip -d /opt/pentaho \
    && rm pdi*.zip

RUN useradd -ms /bin/bash pentaho
USER pentaho
WORKDIR /home/pentaho



COPY ./entrypoint.sh /entrypoint.sh
VOLUME ["/home/app/.kettle"]
CMD ["/opt/pentaho/data-integration/spoon.sh"]
ENTRYPOINT ["/entrypoint.sh"]