README.html : README.rst
	rst2html README.rst > README.html

clean :
	rm -f README.html
