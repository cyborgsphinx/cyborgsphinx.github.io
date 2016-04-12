ROOT = index.html
ABOUT = about/index.html
BLOG = blog/index.html blog/os-fun.html blog/vim-in-emacs.html

all: $(ROOT) $(ABOUT) $(BLOG)

%.html: %.md
	./build $<

clean:
	find . -name '*.html' | xargs rm
