#!/usr/bin/env bash

# Check the tengwarscript package is installed.
kpsewhich tengwarscript.sty
ERROR_CODE=$?
if [ $ERROR_CODE -ne 0 ]; then
    echo "Error: tengwarscript is not installed."
    exit $ERROR_CODE
fi

# Terminate as soon as any command fails
set -e

# Enable the font maps in the tengwarscript package.
updmap --enable Map=tengwarscript.map

# Choose the directory to put the fonts in.
# This could also be just ~/texmf/fonts/truetype.
# The additional directory is a little neater, though,
# and matches the documentation.
FONT_DIR=~/texmf/fonts/truetype/tengwarscript
mkdir -p $FONT_DIR
cd $FONT_DIR

mkdir parmaite
wget 'http://at.mansbjorkman.net/Downloads/Parmaite2.zip'
unzip Parmaite2.zip -d $FONT_DIR/parmaite
cd parmaite
mv --verbose Parmaite.TTF Parmaite.ttf
mv --verbose Parmaite_alt.TTF Parmaite_alt.ttf
cd -


mkdir elfica
wget 'http://www.oocities.org/enrombell/files/Pack_en.zip'
unzip Pack_en.zip -d $FONT_DIR/elfica
cd elfica
mv --verbose Elfica200841se07.ttf Elfica32.ttf
cd -

mkdir gothika
wget 'http://www.oocities.org/enrombell/files/Gothika_en.zip'
unzip Gothika_en.zip -d $FONT_DIR/gothika
cd gothika
mv --verbose Gothika2008-se001.ttf TengwarGothika050.ttf
cd -

mkdir formal
wget 'http://tengwarformal.limes.com.pl/fonts/TengwarFormal-12c-ttf-pc.zip'
unzip TengwarFormal-12c-ttf-pc.zip -d $FONT_DIR/formal
cd formal/TengwarFormal-12c-ttf-pc/fonts
mv --verbose TengwarFormal12b.ttf TengwarFormal12.ttf
mv --verbose TengwarFormalA12b.ttf TengwarFormalA12.ttf
cd -

mkdir annatar
wget -O annatar.zip 'http://web.comhem.se/alatius/fonts/tngan120.zip'
unzip annatar.zip -d $FONT_DIR/annatar
#TODO: check that these all really match

mkdir quenya
wget -O quenya.zip 'http://img.dafont.com/dl/?f=tengwar_quenya'
unzip quenya.zip -d $FONT_DIR/quenya
cd quenya
mv --verbose QUENYA.TTF TengwarQuenya.ttf
mv --verbose QUENYAA.TTF TengwarQuenyaAlt.ttf
mv --verbose QUENCAP1.TTF TengwarQuenyaCapitals1.ttf
mv --verbose QUENCAP2.TTF TengwarQuenyaCapitals2.ttf
cd -

mkdir sindarin
wget -O sindarin.zip 'http://img.dafont.com/dl/?f=tengwar_sindarin'
unzip sindarin.zip -d $FONT_DIR/sindarin
cd sindarin
mv --verbose SINDAR.TTF TengwarSindarin.ttf
mv --verbose SINDARA.TTF TengwarSindarinAlt.ttf
mv --verbose SINDCAP1.TTF TengwarSindarinCapitals1.ttf
mv --verbose SINDCAP2.TTF TengwarSindarinCapitals2.ttf
cd -

mkdir noldor
wget -O noldor.zip 'http://img.dafont.com/dl/?f=tengwar_noldor'
unzip noldor.zip -d $FONT_DIR/noldor
cd noldor
mv --verbose NOLDOR.TTF TengwarNoldor.ttf
mv --verbose NOLDORA.TTF TengwarNoldorAlt.ttf
mv --verbose NOLDCAP1.TTF TengwarNoldorCapitals1.ttf
mv --verbose NOLDCAP2.TTF TengwarNoldorCapitals2.ttf
cd -

mkdir teleri
wget -O teleri.zip 'http://img.dafont.com/dl/?f=tengwar_teleri'
unzip teleri.zip -d $FONT_DIR/teleri
cd teleri
mv --verbose 'Tengwar Telerin.ttf' TengwarTelerin.ttf
cd -

mkdir -p ~/texmf/fonts/type1/tengwarscript/
cd ~/texmf/fonts/type1/tengwarscript/
mkdir unicodeparmaite
wget 'http://www.uv.es/~conrad/UnicodeTengwarParmaite.tar.gz'
tar zxf UnicodeTengwarParmaite.tar.gz -C unicodeparmaite
cd unicodeparmaite
mv --verbose parmaite.pfb UnicodeParmaite.pfb
cd -

# DONE: update names to match /usr/share/texlive/texmf-dist/fonts/map/dvips/tengwarscript/tengwarscript.map
# DONE: install unicodeparmaite as well
