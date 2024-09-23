FROM debian:buster-slim as builder
 
COPY ${PWD}/make.sh /
 
COPY ${PWD}/entrypoint.sh /entrypoint.sh

RUN chmod +x /make.sh && /make.sh
 
FROM debian:buster-slim as final
 
COPY ${PWD}/install.sh /install.sh
 
RUN chmod +x /install.sh && /install.sh

COPY --from=builder --chown=asterisk:asterisk /usr/lib/libasterisk* /usr/lib/
COPY --from=builder --chown=asterisk:asterisk /usr/lib/asterisk/ /usr/lib/asterisk/
COPY --from=builder --chown=asterisk:asterisk /var/spool/asterisk/ /var/spool/asterisk/
COPY --from=builder --chown=asterisk:asterisk /var/log/asterisk/ /var/log/asterisk/
COPY --from=builder --chown=asterisk:asterisk /usr/sbin/asterisk /usr/sbin/asterisk
COPY --from=builder --chown=asterisk:asterisk /etc/asterisk/ /etc/asterisk/
COPY --from=builder --chown=asterisk:asterisk /etc/init.d/asterisk /etc/init.d/
COPY --from=builder --chown=asterisk:asterisk /var/lib/asterisk/ /var/lib/asterisk/
 
COPY --from=builder /entrypoint.sh /entrypoint.sh

RUN mkdir /var/run/asterisk
 
RUN chmod +x /entrypoint.sh

EXPOSE 5060/udp 5060/tcp 8088/tcp 5038/tcp 

ENTRYPOINT [ "/entrypoint.sh" ]