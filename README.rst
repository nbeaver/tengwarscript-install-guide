.. -*- coding: utf-8 -*-

===========================================================
Writing with Tolkien's Elvish alphabet (Tengwar) and LaTeX
===========================================================

:Author: Nathaniel Beaver
:Copyright: Creative Commons Attribution-ShareAlike 4.0 International License

.. contents::

~~~~~~~~~~~~~~~
What's Tengwar?
~~~~~~~~~~~~~~~

The Tengwar comprise an alphabet invented by J.R.R. Tolkien for writing Quenya or Sindarin (Elvish) in his writings such as Lord of the Rings.
It can be used for other languages, too, `including English`_.

This is a guide for getting started producing Tengwar with the LaTeX typesetting system.
It will use the `TengwarScript`_ package.
TengwarScript does not use Tengwar characters directly,
since Tengwar is `still being standardized`_ into Unicode.
Instead, it uses custom fonts.
The fonts are not included in the TengwarScript package,
presumably since the legal status of the fonts is not clear.
The guide includes a `companion script`_ to automate the downloading, installing, and configuring of the fonts,
most of which are TrueType fonts.

There `are`_ `other`_ `methods`_ for writing Tengwar with TeX, `including XeTeX`_, but they will not be used in this guide.
This will focus on producing PDFs. Look elsewhere for writing with Tengwar `on the web`_.

This guide was tested on Debian unstable with TeX Live 2013,
but it should be applicable to most LaTeX installs.

.. _including English: http://3rin.gs/tengwar
.. _TengwarScript: http://www.ctan.org/tex-archive/macros/latex/contrib/tengwarscript
.. _still being standardized: http://www.evertype.com/standards/csur/tengwar.html
.. _companion script: ./install-tengwar-scripts.sh
.. _are: http://www.ctan.org/pkg/tolkienfonts
.. _other: http://www.ctan.org/pkg/elvish
.. _methods: http://www.ctan.org/pkg/tengtex
.. _including XeTeX: http://tex.stackexchange.com/a/57457
.. _on the web: http://freetengwar.sourceforge.net/embedding.html

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Quickstart guide to using Tengwar fonts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

------------
Installation
------------

++++++++++++++++++++++++++++++++++++
Option 1: Run the `install script`_.
++++++++++++++++++++++++++++++++++++

It is a bash script and requires that ``wget`` and ``unzip`` are installed.

If you are doing this for the first time,
the script will download all the fonts into your ``~/texmf`` directory.
If you have downloaded these fonts before and the directory names are the same,
existing files that are older than the new files will be overwritten.

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Option 2: Do the same steps as the install script, but manually.
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#. Ensure you have the `TengwarScript`_ package installed.
   For example, run ``kpsewhich tengwarscript.sty``.
   If you get an output such as::
   
    $ kpsewhich tengwarscript.sty
    /usr/share/texlive/texmf-dist/tex/latex/tengwarscript/tengwarscript.sty
   
   then you are fine. If you get a blank, then you need to install it.
   It is on `CTAN`_ and also on most Linux distribution's packages.
   On Debian, it is in `texlive-fonts-extra`_.
#. Run ``updmap --enable Map=tengwarscript.map``. If you do not run this command, you must `add this line to every Tex file`_ that uses Tengwar fonts::

    \pdfmapfile{=tengwarscript.map}

   Some tutorials recommend running ``mktexlsr`` or ``texhash`` on ``~/texmf`` at this point. This is unnecessary.
#. Make the directory ``~/texmf/fonts/truetype/``. This is in your local ``texmf`` `directory`_, so you don't need administrator privileges.
   If you're not sure where ``texmf`` is, run this command::

       kpsewhich -var-value TEXMFHOME

#. Download the Tengwar fonts you want and unzip them there.

.. _install script: ./install-tengwar-scripts.sh
.. _add this line to every Tex file: http://tex.stackexchange.com/questions/56487/tengwar-script-in-tex-live
.. _CTAN: http://www.ctan.org/pkg/tengwarscript
.. _texlive-fonts-extra: https://packages.debian.org/search?searchon=names&keywords=texlive-fonts-extra
.. _directory: https://vajrabhrt.wordpress.com/2009/04/01/your-home-texmf-tree/

--------------
Testing it out
--------------

After performing option 1 or 2,
compile this document in your favorite LaTeX editor::

    \documentclass{minimal}
    \usepackage[all]{tengwarscript}
    \begin{document}
    \Tquesse\TTacute\Ttinco\TTdoubler\TTthreedots
    \end{document}

This will use the default Parmaite font to write the Tengwar word *quetta*, meaning *word*.
(This is an example from the tengwarscript documentation.)

Once you have a working installation,
you can try more `interesting examples`_.

For convenient Roman to Tengwar transcription,
you will probably want to use a conversion script,
such as the `Perl tengwar transcriber`_.

.. _interesting examples: http://tex.stackexchange.com/questions/13015/what-package-allows-elvish-in-tex
.. _Perl tengwar transcriber: djelibeibi.unex.es/tengwar/

---------------
Troubleshooting
---------------

If you get errors such as
``!pdfTeX error: pdflatex (file Parmaite.ttf): cannot open TrueType font file for reading``,
try changing the font::

    \documentclass{minimal}
    \usepackage[annatar]{tengwarscript}
    \begin{document}
    \Tquesse\TTacute\Ttinco\TTdoubler\TTthreedots
    \end{document}

or try explicitly adding the map file::

    \documentclass{minimal}
    \pdfmapfile{=tengwarscript.map}
    \usepackage[annatar]{tengwarscript}
    \begin{document}
    \Tquesse\TTacute\Ttinco\TTdoubler\TTthreedots
    \end{document}

Make sure the names of the fonts match the names in `tengwarscript.map`_.
You will need to do a lot of renaming of the ``.ttf`` files if you take the manual route (Option 2).

Note: the ``tengtest.tex`` file in the documentation requires ``texlive-lang-spanish``.

.. _tengwarscript.map: /usr/share/texlive/texmf-dist/fonts/map/dvips/tengwarscript/tengwarscript.map

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Provenance status of Tengwar fonts for LaTeX
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The TengwarScript package was updated to v1.3.1 in 2014,
and it now points to archived URL for the fonts since many of the original websites have been taken down.
However, all of the founts can be found with some searching.

------------------
Tengwar Parmaite 2
------------------

Website still up, backup available on Internet Archive.

http://at.mansbjorkman.net/parmaite.htm

http://at.mansbjorkman.net/Downloads/Parmaite2.zip

http://web.archive.org/web/20130217221321/http://at.mansbjorkman.net/Downloads/Parmaite2.zip

------------------------
Unicode Tengwar Parmaite
------------------------

Deprecated in Tengwarscript 1.3,
but still available and on the Internet Archive.

http://www.uv.es/~conrad/tolkien.html

http://www.uv.es/~conrad/UnicodeTengwarParmaite.tar.gz

http://web.archive.org/web/20060720223901/http://www.uv.es/~conrad/UnicodeTengwarParmaite.tar.gz

----------------------------------
Tengwar Elfica and Tengwar Gothika
----------------------------------

Yahoo took down Geocities (410 Gone).

http://www.geocities.com/enrombell/eng_dir/Index.htm

There is an Internet Archive of the page, but not the font packs.

http://web.archive.org/web/20091028081407/http://geocities.com/enrombell/files/Pack_en.zip

http://web.archive.org/web/20091028081410/http://geocities.com/enrombell/files/Gothika_en.zip

Fortunately, third parties have preserved Geocities,
although they don't allow crawling so the Internet Archive won't preserve them.

http://www.oocities.org/enrombell/eng_dir/Index.htm

http://www.oocities.org/enrombell/files/Pack_en.zip

http://www.oocities.org/enrombell/files/Gothika_en.zip

http://www.geocities.ws/enrombell/eng_dir/Index.htm

http://www.geocities.ws/enrombell/files/Pack_en.zip

http://www.geocities.ws/enrombell/files/Gothika_en.zip

--------------
Tengwar Formal
--------------

Website still up, backup available on Internet Archive.

http://tengwarformal.limes.com.pl/

http://tengwarformal.limes.com.pl/fonts/TengwarFormal-12c-ttf-pc.zip

http://web.archive.org/web/20120716182423/http://tengwarformal.limes.com.pl/fonts/TengwarFormal-12c-ttf-pc.zip

---------------
Tengwar Annatar
---------------

Website returns 200 OK, but has been taken down since 2013-08-30.
No backup on Internet Archive.

http://home.student.uu.se/?languageId=1j/jowi4905/fonts/annatar.html

http://web.archive.org/web/20130917205707/http://home.student.uu.se/?languageId=1j/jowi4905/fonts/annatar.html

This site seems to be the new home of the font.

http://web.comhem.se/alatius/fonts/annatar.html

It and the font download is preserved in the Internet Archive.

https://web.archive.org/web/http://web.comhem.se/alatius/fonts/annatar.html

https://web.archive.org/web/http://web.comhem.se/alatius/fonts/tngan120.zip

Third parties also have preserved the fonts, although not completely.

http://www.dafont.com/tengwar-annatar.font

http://img.dafont.com/dl/?f=tengwar_annatar

------------------------------------------------
Tengwar Quenya, Tengwar Sindarin, Tengwar Noldor
------------------------------------------------
Original website gone (301 Moved Permanently).

http://www.geocities.com/fontwizard/font%20tengwar/index.html

The site it has been moved to has the fonts removed:

    This Content has been removed at the request of the Tolkien Estate.
   
    Daniel Steven Smith

http://www.acondia.com/fonts/tengwar/index.html

Fortunately, there is an Internet Archive backup
(thanks to the ``tengwarscript`` package maintainer, Ignacio Fernández Galván, for the link).

http://web.archive.org/web/20060816050032/http://www.acondia.com/font_tengwar/index.html

--------------
Tengwar Teleri
--------------

Page cited in documentation is still up.

http://www.dafont.com/font.php?file=tengwar_teleri

http://img.dafont.com/dl/?f=tengwar_teleri

The page is on the Internet Archive,
but not the font files due to DaFont's `robots.txt <http://img.dafont.com/robots.txt>`_.

http://web.archive.org/web/20120222184558/http://www.dafont.com/font.php?file=tengwar_teleri

~~~~~~~~~~~~~~~~~
Legal information
~~~~~~~~~~~~~~~~~

This guide is released under a `Creative Commons Attribution-ShareAlike 4.0 International License`_.

The associated installation script is released under the `LaTeX Project Public License`_.

.. _Creative Commons Attribution-ShareAlike 4.0 International License: http://creativecommons.org/licenses/by-sa/4.0/
.. _LaTeX Project Public License: http://latex-project.org/lppl/
