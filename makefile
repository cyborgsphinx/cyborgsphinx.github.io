ROOT = index.html
ABOUT = about/index.html
BLOG = blog/vim-in-emacs.html blog/os-fun.html blog/index.html

all: $(ROOT) $(ABOUT) $(BLOG)

%.html: %.md template.head template.tail
	./build.py $<

clean:
	rm $(ROOT) $(ABOUT) $(BLOG)
