#!/usr/bin/env bash
# Author: Nathaniel Morck Beaver (nathanielmbeaver@gmail.com)
# License: MIT

# Check the tengwarscript package is installed.
if kpsewhich tengwarscript.sty > /dev/null
then
    # Set the directory to put the fonts in.
    # This could also be just $TEXMFHOME/fonts/truetype.
    # The additional 'tengwarscript' directory is a little neater, though,
    # and matches the documentation.
    FONT_DIR="$(kpsewhich -var-value=TEXMFHOME)/fonts/truetype/tengwarscript"
else
    printf 'Error: tengwarscript is not installed.\n'
    exit 1
fi

# Terminate as soon as any command fails
set -e

# In case CDPATH is set,
# unset it so we can reliably cd to relative paths.
unset CDPATH
# https://bosker.wordpress.com/2012/02/12/bash-scripters-beware-of-the-cdpath/

# Enable the font maps in the tengwarscript package.
updmap --quiet --enable Map=tengwarscript.map

mkdir -p "$FONT_DIR"
cd "$FONT_DIR"

# Warning: the following way of entering and exiting directories avoids having to
# prefix every file with $FONT_DIR, but also makes it susceptible to forgetting
# the current directory and end up putting things in the wrong place. I've
# decided that it's easier to explicitly enter and exit directories than to put
# $FONT_DIR in front of everything, and then potentially forget that when editing
# later.

mkdir -p parmaite
curl --silent --show-error --remote-name 'http://at.mansbjorkman.net/Downloads/Parmaite2.zip'
unzip -q -u Parmaite2.zip -d "$FONT_DIR/parmaite"
cd parmaite
mv Parmaite.TTF Parmaite.ttf
mv Parmaite_alt.TTF Parmaite_alt.ttf
cd "$FONT_DIR"

mkdir -p elfica
curl --silent --show-error --remote-name 'http://www.oocities.org/enrombell/files/Pack_en.zip'
unzip -q -u Pack_en.zip -d "$FONT_DIR/elfica"
cd elfica
mv Elfica200841se07.ttf Elfica32.ttf
cd "$FONT_DIR"

mkdir -p gothika
curl --silent --show-error --remote-name 'http://www.oocities.org/enrombell/files/Gothika_en.zip'
unzip -q -u Gothika_en.zip -d "$FONT_DIR/gothika"
cd gothika
mv Gothika2008-se001.ttf TengwarGothika050.ttf
cd "$FONT_DIR"

mkdir -p formal
curl --silent --show-error --remote-name 'http://tengwarformal.limes.com.pl/fonts/TengwarFormal-12c-ttf-pc.zip'
unzip -q -u TengwarFormal-12c-ttf-pc.zip -d "$FONT_DIR/formal"
cd "formal/TengwarFormal-12c-ttf-pc/fonts"
mv TengwarFormal12b.ttf TengwarFormal12.ttf
mv TengwarFormalA12b.ttf TengwarFormalA12.ttf
cd "$FONT_DIR"

mkdir -p "annatar"
curl --silent --show-error --location --output annatar.zip 'http://web.archive.org/web/20150908132446/http://web.comhem.se/alatius/fonts/tngan120.zip'
unzip -q -u annatar.zip -d "$FONT_DIR/annatar"

mkdir -p "quenya"
curl --silent --show-error --location --output quenya.zip 'http://web.archive.org/web/20060816050032/http://www.acondia.com/font_tengwar/TengwarQuenya_v19E.zip'
unzip -q -u quenya.zip -d "$FONT_DIR/quenya"
cd "$FONT_DIR"

mkdir -p "sindarin"
curl --silent --show-error --location --output sindarin.zip 'http://web.archive.org/web/20060816050032/http://www.acondia.com/font_tengwar/TengwarSindarin_v19E.zip'
unzip -q -u sindarin.zip -d "$FONT_DIR/sindarin"
cd "$FONT_DIR"

mkdir -p "noldor"
curl --silent --show-error --location --output noldor.zip 'http://web.archive.org/web/20060816050032/http://www.acondia.com/font_tengwar/TengwarNoldor_v19E.zip'
unzip -q -u noldor.zip -d "$FONT_DIR/noldor"
cd "$FONT_DIR"

mkdir -p "teleri"
curl --silent --show-error --location --output teleri.zip 'http://img.dafont.com/dl/?f=tengwar_teleri'
unzip -q -u teleri.zip -d "$FONT_DIR/teleri"
cd teleri
mv 'Tengwar Telerin.ttf' 'TengwarTelerin.ttf'
cd "$FONT_DIR"

mkdir -p ~/texmf/fonts/type1/tengwarscript/
cd ~/texmf/fonts/type1/tengwarscript/
mkdir -p "unicodeparmaite"
curl --silent --show-error --remote-name 'https://www.uv.es/~conrad/UnicodeTengwarParmaite.tar.gz'
tar -xf UnicodeTengwarParmaite.tar.gz -C unicodeparmaite
cd "unicodeparmaite"
mv parmaite.pfb UnicodeParmaite.pfb
cd ~/texmf/fonts/type1/tengwarscript/

# DONE: update names to match /usr/share/texlive/texmf-dist/fonts/map/dvips/tengwarscript/tengwarscript.map
# DONE: install unicodeparmaite as well
# DONE: make install safer by removing `cd -` commands.
