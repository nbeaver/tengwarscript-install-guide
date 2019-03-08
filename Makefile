RST := $(wildcard *.rst)
HTML := $(patsubst %.rst, %.html, $(RST))

.PHONY : shellcheck clean

shellcheck :
	shellcheck install-tengwar-scripts.sh

%.html: %.rst
	rst2html $< $@

clean:
	rm -f -- $(HTML)
