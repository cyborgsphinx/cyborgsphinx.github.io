ROOT = index.html
BLOG = $(shell ls src/blog/*.md | sed 's/\.md/\.html/' | sed 's/src\///')

.PHONY: all clean

all: $(ROOT) $(ABOUT) $(BLOG)

%.html: src/%.md src/template.html
	./build.sh $< $@ src/template

blog/%.html: src/blog/%.md src/blog/template.html
	./build.sh $< $@ src/blog/template

clean:
	rm index.html blog/*
