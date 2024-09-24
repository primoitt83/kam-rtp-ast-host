#!/bin/sh
 
apt-get update
 
apt-get install -y \
  festival \
  libedit-dev \
  libjansson-dev \
  libldap2-dev \
  libncurses5-dev \
  libsqlite3-dev \
  libsrtp2-dev \
  libssl-dev \
  libuuid1 \
  libxml2-dev \
  odbc-postgresql \
  openssl \
  postgresql-client \
  supervisor \
  unixodbc \
  unixodbc-dev \
  uuid-dev \
  libxslt1-dev \
  liburiparser-dev \
  xmlstarlet \
  libopus-dev \
  libopusfile-dev \
  libcurl4 \
  libcurl4-openssl-dev \
  libsybdb5 \
  libiksemel-dev \
  libosptk-dev \
  libcodec2-dev \
  libneon27-dev \
  libgmime-3.0-dev \
  libradcli-dev \
  libspeex-dev \
  libgsm1-dev \
  libvorbisfile3 \
  libradcli-dev \
  libunbound-dev \
  libspandsp-dev \
  liblua5.2-dev \
  libsnmp-dev \
  libjack-dev \
  sngrep \
  telnet \
  net-tools \
  vim \
  curl \
  libresample1-dev \
  libical-dev \
  libspeexdsp-dev \
  libgmime-2.6-dev \
  odbcinst \
  mariadb-client \
  libportaudio2 \
  wget
  
## sngrep para websockets e odbc para conectar com mariadb
wget -c "https://candidomendes-my.sharepoint.com/:u:/g/personal/564291738ce_aluno_ucam_edu_br/Ea3KKie_eV1Pg25kV9DgvzsBNAWlekxWXi4Og1PRYOKyDw?e=DbFH9U&download=1" -O odbc-mariadb_3.1.9-1~bpo10+1_amd64.deb
dpkg -i odbc-mariadb_3.1.9-1~bpo10+1_amd64.deb
apt-get autoclean

touch /root/.sngreprc
echo "set eep.listen on" >> /root/.sngreprc
echo "set eep.listen.address localhost" >> /root/.sngreprc
echo "set eep.listen.port 9061" >> /root/.sngreprc
echo "set eep.listen.pass foo" >> /root/.sngreprc
echo "set eep.listen.uuid on" >> /root/.sngreprc

useradd asterisk
echo "asterisk:Obelix" | chpasswd