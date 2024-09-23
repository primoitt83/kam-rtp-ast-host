#!/bin/sh
 
apt-get update
 
apt-get install -y \
  build-essential \
  curl \
  git \
  gzip \
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
  sqlite3 \
  tar \
  unixodbc \
  unixodbc-dev \
  uuid-dev \
  wget
 
#wget --no-check-certificate https://discorl.serpro.gov.br/index.php/s/TkDd6my6nXoMNi7/download/asterisk-16-current.tar.gzs
wget -c "https://candidomendes-my.sharepoint.com/:u:/g/personal/564291738ce_aluno_ucam_edu_br/EZP18AD0WDJMmafGPbdGcecBXquO6Z65ygIGbODDSNIMpQ?e=uPYbGH&download=1" -O asterisk-16-current.tar.gz
tar -xvf asterisk-*
# Comente daqui pra baixo para alterar coisas no asterisk
cd asterisk*/
export DEBIAN_FRONTEND=noninteractive
contrib/scripts/install_prereq install
./configure --with-pjproject-bundled
make menuselect.makeopts
menuselect/menuselect --disable-category MENUSELECT_CDR menuselect.makeopts
menuselect/menuselect --disable-category MENUSELECT_CEL menuselect.makeopts
menuselect/menuselect --enable MOH-OPSOUND-WAV menuselect.makeopts
menuselect/menuselect --disable-category MENUSELECT_UTILS menuselect.makeopts
menuselect/menuselect --disable astcanary --disable astdb2sqlite3 --disable astdb2bdb menuselect.makeopts
menuselect/menuselect --disable CORE-SOUNDS-EN-GSM menuselect.makeopts
menuselect/menuselect --enable CORE-SOUNDS-EN-WAV menuselect.makeopts
menuselect/menuselect --enable codec_opus menuselect.makeopts
menuselect/menuselect --enable res_config_ldap menuselect.makeopts
make -j4
make install
make config
make samples