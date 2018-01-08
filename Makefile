RST := $(wildcard *.rst)
HTML := $(patsubst %.rst, %.html, $(RST))

.PHONY : all clean
all: $(HTML)

%.html: %.rst
	rst2html $< $@

clean:
	rm -f -- $(HTML)
