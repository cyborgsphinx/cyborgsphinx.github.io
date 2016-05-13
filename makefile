ROOT = index.html
ABOUT = about/index.html
BLOG = blog/site-build.html blog/web-rant.html blog/vim-in-emacs.html blog/os-fun.html blog/index.html

all: $(ROOT) $(ABOUT) $(BLOG)

%.html: %.md
	./build.py $<

clean:
	rm $(ROOT) $(ABOUT) $(BLOG)
