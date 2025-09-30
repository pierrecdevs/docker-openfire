FROM openjdk:19-jdk-alpine

RUN apk add --no-cache vim postgresql-client tzdata shadow runit bash bind-tools sudo unzip maven java-postgresql-jdbc

## Daemons
RUN groupadd -g 2000 openfire
RUN useradd openfire -u 2000 -g 2000


RUN mkdir -p /etc/service/openfire
COPY --chown=openfire:openfire openfire.sh /etc/service/openfire/run
RUN chmod +x /etc/service/openfire/run

COPY --chown=openfire:openfire pre-conf.sh /sbin/pre-conf
RUN chmod +x /sbin/pre-conf; sync \
  && /bin/bash -c /sbin/pre-conf \
  && rm /sbin/pre-conf

RUN chown -R openfire:openfire /usr/share/openfire
RUN chown -R openfire:openfire /etc/service/openfire

USER openfire
WORKDIR /usr/share/openfire
EXPOSE 7443 7777 9090 9091 5000-5100/udp 5000-6000/tcp 10000-10050/udp

CMD ["/etc/service/openfire/run"]
