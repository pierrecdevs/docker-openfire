#!/usr/bin/env bash

if [ -f /etc/default/openfire ] ; then
        . /etc/default/openfire
fi

JAVA_HOME=/usr
PATH=/sbin:/bin:/usr/sbin:/usr/bin:${JAVA_HOME}/bin
JAVA=${JAVA_HOME}/bin/java
NAME=openfire
DESC=openfire
DAEMON_DIR=/usr/share/openfire
DAEMON_LIB=${DAEMON_DIR}/lib

DAEMON_OPTS="-server -DopenfireHome=${DAEMON_DIR} \
 -Dopenfire.lib.dir=${DAEMON_LIB} -Dlog4j.configurationFile=${DAEMON_LIB}/log4j2.xml -Djdk.tls.ephemeralDHKeySize=matched -Djsse.SSLEngine.acceptLargeFragments=true -classpath ${DAEMON_LIB}/startup.jar \
 --add-modules java.se --add-exports java.base/jdk.internal.ref=ALL-UNNAMED --add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.base/java.nio=ALL-UNNAMED --add-opens java.base/sun.nio.ch=ALL-UNNAMED --add-opens java.management/sun.management=ALL-UNNAMED --add-opens jdk.management/com.sun.management.internal=ALL-UNNAMED \
 -jar ${DAEMON_LIB}/startup.jar"


exec $JAVA $DAEMON_OPTS
