#!/bin/sh
 
if [ "$1" = "" ]; then
  COMMAND="/usr/sbin/asterisk -T -W -U asterisk -p -nvvvdddf"
else
  COMMAND="$@"
fi

## Send ips from env to conf file
sed -i "s/DOMINIO_BASE/$DOMINIO_BASE/g" /etc/asterisk/pjsip.conf
sed -i "s/IPINTERNO/$IPINTERNO/g" /etc/asterisk/pjsip.conf

## Send ports from env to conf file
sed -i "s/PORT_MIN/$PORT_MIN/g" /etc/asterisk/rtp.conf
sed -i "s/PORT_MAX/$PORT_MAX/g" /etc/asterisk/rtp.conf

chown -R asterisk: /etc/certs
chmod 775 -R /etc/certs
chown -R asterisk:  /var/log/asterisk \
                    /var/lib/asterisk \
                    /var/run/asterisk \
                    /var/spool/asterisk
exec ${COMMAND}