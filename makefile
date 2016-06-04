ROOT = index.html
ABOUT = $(shell ls about | grep '\.md' | sed 's/\.md/\.html/' | sed 's/^/about\//')
BLOG = $(shell ls blog | grep '\.md' | sed 's/\.md/\.html/' | sed 's/^/blog\//')
SANDBOX = $(shell ls sandbox | grep '\.md' | sed 's/\.md/\.html/' | sed 's/^/sandbox\//')

all: $(ROOT) $(ABOUT) $(BLOG) $(SANDBOX)

%.html: %.md
	./build.py $<

clean:
	rm $(ROOT) $(ABOUT) $(BLOG) $(SANDBOX)
