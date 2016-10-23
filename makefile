ROOT = index.html
ABOUT = $(shell ls about | grep '\.md' | sed 's/\.md/\.html/' | sed 's/^/about\//')
BLOG = $(shell ls blog | grep '\.md' | sed 's/\.md/\.html/' | sed 's/^/blog\//')

.PHONY: all clean

all: $(ROOT) $(ABOUT) $(BLOG)

%.html: %.md
	./build.py $<

clean:
	rm $(ROOT) $(ABOUT) $(BLOG)
