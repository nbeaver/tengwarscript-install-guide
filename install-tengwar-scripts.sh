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

# In case CDPATH is set,
# unset it so we can reliably cd to relative paths.
unset CDPATH
# https://bosker.wordpress.com/2012/02/12/bash-scripters-beware-of-the-cdpath/

# Enable the font maps in the tengwarscript package.
updmap --enable Map=tengwarscript.map

# Choose the directory to put the fonts in.
# This could also be just ~/texmf/fonts/truetype.
# The additional directory is a little neater, though,
# and matches the documentation.
FONT_DIR=~/texmf/fonts/truetype/tengwarscript
mkdir -p $FONT_DIR
cd $FONT_DIR

# Note: the following way of entering and exiting directories avoids having to prefix every file with $FONT_DIR,
# but also makes it susceptible to forgetting the current directory and end up putting things in the wrong place.
# I've decided that it's easier to explicitly enter and exit directories than to put $FONT_DIR in front of everything,
# and then potentially forget that when editing later.
mkdir -p parmaite
wget --no-verbose --continue 'http://at.mansbjorkman.net/Downloads/Parmaite2.zip'
unzip -u Parmaite2.zip -d $FONT_DIR/parmaite
cd parmaite
mv -v Parmaite.TTF Parmaite.ttf
mv -v Parmaite_alt.TTF Parmaite_alt.ttf
cd $FONT_DIR

mkdir -p elfica
wget --no-verbose --continue 'http://www.oocities.org/enrombell/files/Pack_en.zip'
unzip -u Pack_en.zip -d $FONT_DIR/elfica
cd elfica
mv -v Elfica200841se07.ttf Elfica32.ttf
cd $FONT_DIR

mkdir -p gothika
wget --no-verbose --continue 'http://www.oocities.org/enrombell/files/Gothika_en.zip'
unzip -u Gothika_en.zip -d $FONT_DIR/gothika
cd gothika
mv -v Gothika2008-se001.ttf TengwarGothika050.ttf
cd $FONT_DIR

mkdir -p formal
wget --no-verbose --continue 'http://tengwarformal.limes.com.pl/fonts/TengwarFormal-12c-ttf-pc.zip'
unzip -u TengwarFormal-12c-ttf-pc.zip -d $FONT_DIR/formal
cd formal/TengwarFormal-12c-ttf-pc/fonts
mv -v TengwarFormal12b.ttf TengwarFormal12.ttf
mv -v TengwarFormalA12b.ttf TengwarFormalA12.ttf
cd $FONT_DIR

mkdir -p annatar
wget --no-verbose --continue -O annatar.zip 'http://web.comhem.se/alatius/fonts/tngan120.zip'
unzip -u annatar.zip -d $FONT_DIR/annatar

mkdir -p quenya
wget --no-verbose --continue -O quenya.zip 'http://web.archive.org/web/20060816050032/http://www.acondia.com/font_tengwar/TengwarQuenya_v19E.zip'
unzip -u quenya.zip -d $FONT_DIR/quenya
cd $FONT_DIR

mkdir -p sindarin
wget --no-verbose --continue -O sindarin.zip 'http://web.archive.org/web/20060816050032/http://www.acondia.com/font_tengwar/TengwarSindarin_v19E.zip'
unzip -u sindarin.zip -d $FONT_DIR/sindarin
cd $FONT_DIR

mkdir -p noldor
wget --no-verbose --continue -O noldor.zip 'http://web.archive.org/web/20060816050032/http://www.acondia.com/font_tengwar/TengwarNoldor_v19E.zip'
unzip -u noldor.zip -d $FONT_DIR/noldor
cd $FONT_DIR

mkdir -p teleri
wget --no-verbose --continue -O teleri.zip 'http://img.dafont.com/dl/?f=tengwar_teleri'
unzip -u teleri.zip -d $FONT_DIR/teleri
cd teleri
mv -v 'Tengwar Telerin.ttf' TengwarTelerin.ttf
cd $FONT_DIR

mkdir -p ~/texmf/fonts/type1/tengwarscript/
cd ~/texmf/fonts/type1/tengwarscript/
mkdir -p unicodeparmaite
wget --no-verbose --continue 'http://www.uv.es/~conrad/UnicodeTengwarParmaite.tar.gz'
tar -zxT UnicodeTengwarParmaite.tar.gz -C unicodeparmaite
cd unicodeparmaite
mv -v parmaite.pfb UnicodeParmaite.pfb
cd ~/texmf/fonts/type1/tengwarscript/

# DONE: update names to match /usr/share/texlive/texmf-dist/fonts/map/dvips/tengwarscript/tengwarscript.map
# DONE: install unicodeparmaite as well
# DONE: make install safer by removing `cd -` commands.
