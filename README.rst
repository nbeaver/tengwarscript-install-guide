============================================================
Writing with Tolkien's Elvish alphabets (Tengwar) with LaTeX
============================================================

~~~~~~~~~~~~~~~
What's Tengwar?
~~~~~~~~~~~~~~~

The Tengwar comprise an alphabet invented by J.R.R. Tolkien for writing Quenya or Sindarin (Elvish) in his writings such as Lord of the Rings.
It can be used for other languages, too, `including English`_.

This is a guide for getting started producing Tengwar with the LaTeX typesetting system.
It will use the `TengwarScript`_ package, which requires custom fonts.
The fonts are not included in the TengwarScript package,
presumably since the legal status of the fonts is not clear.

TengwarScript does not use Tengwar characters directly,
since Tengwar is `still being standardized`_ into Unicode.

There are `other methods`_ for writing Tengwar, including XeTeX, but they will not be used in this guide.
This will focus on producing PDFs. Look elsewhere for writing with Tengwar `on the web`.

This guide was tested on Debian unstable with TeX Live 2013,
but it should be applicable to most LaTeX installs.

.. _including English: http://3rin.gs/tengwar
.. _TengwarScript: http://www.ctan.org/tex-archive/macros/latex/contrib/tengwarscript
.. _still being standardized: http://www.evertype.com/standards/csur/tengwar.html
.. _other methods: http://tex.stackexchange.com/a/57457
.. _on the web: http://freetengwar.sourceforge.net/embedding.html

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Quickstart guide to using Tengwar fonts
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

------------
Installation
------------

Option 1: Run the `install script`_.

Option 2: Do the same steps in the install script, but manually.

#. Ensure you have the `TengwarScript`_ package installed.
   For example, run ``kpsewhich tengwarscript.sty``.
   If you get an output such as::
   
    $ kpsewhich tengwarscript.sty
    /usr/share/texlive/texmf-dist/tex/latex/tengwarscript/tengwarscript.sty
   
   then you are fine. If you get a blank, then you need to install it.
   On Debian, it is in `texlive-fonts-extra`_.
#. Run ``updmap --enable Map=tengwarscript.map``. If you do not run this command, you must `add this line to every Tex file`_ that uses Tengwar fonts::

    \pdfmapfile{=tengwarscript.map}

   Some tutorials reccomend running ``mktexlsr`` or ``texhash`` on ``~/texmf`` at this point. This is unnecessary.
#. Make the directory ``~/texmf/fonts/truetype/``. This is in your local ``texmf`` directory, so you don't need administrator privileges.
#. Download the Tengwar fonts you want and unzip them there.

.. _install script: ./install-tengwar-scripts.sh
.. _add this line to every Tex file: http://tex.stackexchange.com/questions/56487/tengwar-script-in-tex-live
.. _texlive-fonts-extra: https://packages.debian.org/search?searchon=names&keywords=texlive-fonts-extra

--------------
Testing it out
--------------

After performing option 1 or 2, run this example script in your favorite LaTeX editor::

    \documentclass{minimal}
    \usepackage[all]{tengwarscript}
    \begin{document}
    \Tquesse\TTacute\Ttinco\TTdoubler\TTthreedots
    \end{document}

This will use the default Parmaite font to write the Tengwar word *quetta*, meaning *word*.
(This is an example from the tengwarscript documentation.)

Once you have a working installation, you can try more `interesting examples`.

.. _interesting examples: http://tex.stackexchange.com/questions/13015/what-package-allows-elvish-in-tex

---------------
Troubleshooting
---------------

If you get errors such as
``!pdfTeX error: pdflatex (file Parmaite.ttf): cannot open TrueType font file for reading``
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
You will need to do a lot of renaming of the ``.ttf`` files if you take the manual route.

Note: the ``tengtest.tex`` file in the documentation requires ``texlive-lang-spanish``.

.. _tengwarscript.map: /usr/share/texlive/texmf-dist/fonts/map/dvips/tengwarscript/tengwarscript.map

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Provenance status of Tengwar fonts for LaTeX
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

The LaTeX package TengwarScript 1.3 lists several fonts for writing in Tengwar with LaTeX.
However, the package has not been updated since 2007,
and many of the fonts have become hard to find.
Some of the websites in the documentation have been moved or taken down.
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

Deprecated in Tengwarscript 1.3, but still available and on the Internet Archive.

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

Fortunately, third parties have preserved Geocities, although they don't allow crawling so the Internet Archive won't preserve them.

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

Third parties also have preserved the fonts.

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

Neither of them has an Internet Archive backup.
 
https://web.archive.org/web/http://www.acondia.com/fonts/tengwar/index

https://web.archive.org/web/http://www.geocities.com/fontwizard/font%20tengwar/index.html

Fortunately, third parties have preserved the fonts.

http://www.dafont.com/tengwar-quenya.font

http://img.dafont.com/dl/?f=tengwar_quenya

http://www.dafont.com/tengwar-sindarin.font

http://img.dafont.com/dl/?f=tengwar_sindarin

http://www.dafont.com/tengwar-noldor.font

http://img.dafont.com/dl/?f=tengwar_noldor

--------------
Tengwar Teleri
--------------

Page cited in documentation is still up.

http://www.dafont.com/font.php?file=tengwar_teleri

http://img.dafont.com/dl/?f=tengwar_teleri

The page is on the Internet Archive, but not the font files due to DaFont's `robots.txt <http://img.dafont.com/robots.txt>`_.

http://web.archive.org/web/20120222184558/http://www.dafont.com/font.php?file=tengwar_teleri
