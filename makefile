ROOT = index.html
ABOUT = $(shell ls src/about/*.md | sed 's/\.md/\.html/' | sed 's/src\///')
BLOG = $(shell ls src/blog/*.md | sed 's/\.md/\.html/' | sed 's/src\///')

.PHONY: all clean

all: $(ROOT) $(ABOUT) $(BLOG)

%.html: src/%.md
	./build.sh $< $@ src/template

about/%.html: src/about/%.md
	./build.sh $< $@ src/about/template

blog/%.html: src/blog/%.md
	./build.sh $< $@ src/blog/template

clean:
	rm index.html about/* blog/*
