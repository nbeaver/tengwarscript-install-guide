#!/usr/bin/env bash
mkdir -p ~/texmf/fonts/truetype/tengwarscript
wget http://at.mansbjorkman.net/Downloads/Parmaite2.zip
unzip Parmaite2.zip -d ~/texmf/fonts/truetype/tengwarscript

wget http://www.oocities.org/enrombell/files/Pack_en.zip
unzip Pack_en.zip -d ~/texmf/fonts/truetype/tengwarscript 

wget http://www.oocities.org/enrombell/files/Gothika_en.zip
unzip Gothika_en.zip -d ~/texmf/fonts/truetype/tengwarscript

wget http://tengwarformal.limes.com.pl/fonts/TengwarFormal-12c-ttf-pc.zip
unzip TengwarFormal-12c-ttf-pc.zip -d ~/texmf/fonts/truetype/tengwarscript

wget http://www.fontspace.com/download/2244/280a9b63cbfa4ca581ffbc45bd15d346/johan-winge_tengwar-annatar.zip
unzip johan-winge_tengwar-annatar.zip -d ~/texmf/fonts/truetype/tengwarscript

wget http://www.fontspace.com/download/1743/f917dbc46e664527a262b46df3f53d59/dan-smiths-fantasy-fonts_tengwar-quenya.zip
unzip dan-smiths-fantasy-fonts_tengwar-quenya.zip -d ~/texmf/fonts/truetype/tengwarscript

wget http://www.fontspace.com/download/1744/e6ef9550f05b4c878c5710b73a60191b/dan-smiths-fantasy-fonts_tengwar-sindarin.zip
unzip dan-smiths-fantasy-fonts_tengwar-sindarin.zip -d ~/texmf/fonts/truetype/tengwarscript

wget http://www.fontspace.com/download/1742/dab2eeb9353f4a1ba471c7bb2b49d46c/dan-smiths-fantasy-fonts_tengwar-noldor.zip
unzip dan-smiths-fantasy-fonts_tengwar-noldor.zip -d ~/texmf/fonts/truetype/tengwarscript

mktexlsr ~/texmf
