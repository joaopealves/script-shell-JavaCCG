#!/bin/bash

## Instalação do pacote ntpdate e configuração do servidor de horas
apt-get install -y ntpdate

ntpdate 172.21.5.10

## Instalação do pacote java correto: Java 6, Update 27

apt-get install -y java-common

cd /tmp
wget http://chamados.sipam.gov.br/pacotes/gpis-java/oracle-java6-jre_6u27_amd64.deb
dpkg -i oracle-java6-jre_6u27_amd64.deb

cd /home/gpis/Documentos/
wget http://chamados.sipam.gov.br/pacotes/gpis-java/fmde.jnlp
wget http://chamados.sipam.gov.br/pacotes/gpis-java/m2sa.jnlp
wget http://chamados.sipam.gov.br/pacotes/gpis-java/madm.jnlp

cd /home/gpis/.java/
wget http://chamados.sipam.gov.br/pacotes/gpis-java/javaws.jpeg


## criando os lançadores de aplicativos

## Lançador para o FMDE
cat <<EOF > /usr/share/applications/FMDE.desktop
[Desktop Entry]
Name=Javaws
Comment=Javaws
Exec=/usr/bin/javaws /home/gpis/Documentos/fmde.jnlp
Icon=/home/gpis/.java/jawas.jpeg
Terminal=false
Type=Application
StartupNotify=true
NoDisplay=true
Name[pt_BR]=FMDE
EOF

## Lançador para o M2SA
cat <<EOF > /usr/share/applications/M2SA.desktop
[Desktop Entry]
Name=Javaws
Comment=Javaws
Exec=/usr/bin/javaws /home/gpis/Documentos/m2sa.jnlp
Icon=/home/gpis/.java/jawas.jpeg
Terminal=false
Type=Application
StartupNotify=true
NoDisplay=true
Name[pt_BR]=M2SA
EOF

## Lançador para o MADM
cat <<EOF > /usr/share/applications/MADM.desktop
[Desktop Entry]
Name=Javaws
Comment=Javaws
Exec=/usr/bin/javaws /home/gpis/Documentos/madm.jnlp
Icon=/home/gpis/.java/jawas.jpeg
Terminal=false
Type=Application
StartupNotify=true
NoDisplay=true
Name[pt_BR]=MADM
EOF

cd /home/gpis/Área\ de\ Trabalho
ln -s /usr/share/applications/FMDE.desktop FMDE.desktop
ln -s /usr/share/applications/M2SA.desktop M2SA.desktop
ln -s /usr/share/applications/MADM.desktop MADM.desktop
