#!/usr/bin/env bash

# Enable the font maps in the tengwarscript package.
updmap --enable Map=tengwarscript.map

# Choose the directory to put the fonts in.
# This could also be just ~/texmf/fonts/truetype.
# The additional directory is a little neater, though.
FONT_DIR=~/texmf/fonts/truetype/tengwarscript
mkdir -p $FONT_DIR
cd $FONT_DIR

mkdir parmaite
wget 'http://at.mansbjorkman.net/Downloads/Parmaite2.zip'
unzip Parmaite2.zip -d $FONT_DIR/parmaite
cd parmaite
mv Parmaite.TTF Parmaite.ttf
mv Parmaite_alt.TTF Parmaite_alt.ttf
cd -


mkdir elfica
wget 'http://www.oocities.org/enrombell/files/Pack_en.zip'
unzip Pack_en.zip -d $FONT_DIR/elfica
cd elfica
mv QUENYA.TTF TengwarQuenya.ttf
mv QUENYAA.TTF TengwarQuenyaAlt.ttf
mv QUENCAP1.TTF TengwarQuenyaCapitals1.ttf
mv QUENCAP2.TTF TengwarQuenyaCapitals2.ttf
cd -

mkdir gothika
wget 'http://www.oocities.org/enrombell/files/Gothika_en.zip'
unzip Gothika_en.zip -d $FONT_DIR/gothika
cd gothika
mv Gothika2008-se001.ttf TengwarGothika050.ttf
cd -

mkdir formal
wget 'http://tengwarformal.limes.com.pl/fonts/TengwarFormal-12c-ttf-pc.zip'
unzip TengwarFormal-12c-ttf-pc.zip -d $FONT_DIR/formal
cd formal/TengwarFormal-12c-ttf-pc/fonts
mv TengwarFormal12b.ttf TengwarFormal12.ttf
mv TengwarFormalA12b.ttf TengwarFormalA12.ttf
cd -

mkdir annatar
wget -O annatar.zip 'http://img.dafont.com/dl/?f=tengwar_annatar'
unzip annatar.zip -d $FONT_DIR/annatar
#TODO: check that these all really match

mkdir quenya
wget -O quenya.zip 'http://img.dafont.com/dl/?f=tengwar_quenya'
unzip quenya.zip -d $FONT_DIR/quenya
cd quenya
mv QUENYA.TTF TengwarQuenya.ttf
mv QUENYAA.TTF TengwarQuenyaAlt.ttf
mv QUENCAP1.TTF TengwarQuenyaCapitals1.ttf
mv QUENCAP2.TTF TengwarQuenyaCapitals2.ttf
cd -

mkdir sindarin
wget -O sindarin.zip 'http://img.dafont.com/dl/?f=tengwar_sindarin'
unzip sindarin.zip -d $FONT_DIR/sindarin
cd sindarin
mv SINDAR.TTF TengwarSindarin.ttf
mv SINDARA.TTF TengwarSindarinAlt.ttf
mv SINDCAP1.TTF TengwarSindarinCapitals1.ttf
mv SINDCAP2.TTF TengwarSindarinCapitals2.ttf
cd -

mkdir noldor
wget -O noldor.zip 'http://img.dafont.com/dl/?f=tengwar_noldor'
unzip noldor.zip -d $FONT_DIR/noldor
cd noldor
mv NOLDOR.TTF TengwarNoldor.ttf
mv NOLDORA.TTF TengwarNoldorAlt.ttf
mv NOLDCAP1.TTF TengwarNoldorCapitals1.ttf
mv NOLDCAP2.TTF TengwarNoldorCapitals2.ttf
cd -

mkdir teleri
wget -O teleri.zip 'http://img.dafont.com/dl/?f=tengwar_teleri'
unzip teleri.zip -d $FONT_DIR/teleri
cd teleri
mv 'Tengwar Telerin.ttf' TengwarTelerin.ttf
cd -

# DONE: update names to match /usr/share/texlive/texmf-dist/fonts/map/dvips/tengwarscript/tengwarscript.map
