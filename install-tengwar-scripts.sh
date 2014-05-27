#!/usr/bin/env bash

FONT_DIR=~/texmf/fonts/truetype/tengwarscript
mkdir -p $FONT_DIR

mkdir $FONT_DIR/parmaite
wget 'http://at.mansbjorkman.net/Downloads/Parmaite2.zip'
unzip Parmaite2.zip -d $FONT_DIR/parmaite

mkdir $FONT_DIR/elfica
wget 'http://www.oocities.org/enrombell/files/Pack_en.zip'
unzip Pack_en.zip -d $FONT_DIR/elfica

mkdir $FONT_DIR/gothika
wget 'http://www.oocities.org/enrombell/files/Gothika_en.zip'
unzip Gothika_en.zip -d $FONT_DIR/gothika

mkdir $FONT_DIR/formal
wget 'http://tengwarformal.limes.com.pl/fonts/TengwarFormal-12c-ttf-pc.zip'
unzip TengwarFormal-12c-ttf-pc.zip -d $FONT_DIR/formal

mkdir $FONT_DIR/annatar
wget -O annatar.zip 'http://img.dafont.com/dl/?f=tengwar_annatar'
unzip annatar.zip -d $FONT_DIR/annatar

mkdir $FONT_DIR/quenya
wget -O quenya.zip 'http://img.dafont.com/dl/?f=tengwar_quenya'
unzip quenya.zip -d $FONT_DIR/quenya

mkdir $FONT_DIR/sindarin
wget -O sindarin.zip 'http://img.dafont.com/dl/?f=tengwar_sindarin'
unzip sindarin.zip -d $FONT_DIR/sindarin

mkdir $FONT_DIR/noldor
wget -O noldor.zip 'http://img.dafont.com/dl/?f=tengwar_noldor'
unzip noldor.zip -d $FONT_DIR/noldor

mkdir $FONT_DIR/teleri
wget -O teleri.zip 'http://img.dafont.com/dl/?f=tengwar_teleri'
unzip teleri.zip -d $FONT_DIR/teleri

# mktexlsr ~/texmf
# TODO: run upmapd?
# TODO: update names to match /usr/share/texlive/texmf-dist/fonts/map/dvips/tengwarscript/tengwarscript.map
