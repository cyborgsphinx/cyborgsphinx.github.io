ROOT = index.html
BLOG = $(shell ls src/blog/*.md | sed 's/\.md/\.html/' | sed 's/src\///')

.PHONY: all clean

all: $(ROOT) $(ABOUT) $(BLOG)

%.html: src/%.md src/template.html
	@echo "Creating $@ from $<"
	pandoc -t html $< --template=src/template -o $@
	tidy -qim $@

blog/%.html: src/blog/%.md src/blog/template.html
	@echo "Creating $@ from $<"
	pandoc -t html $< --template=src/blog/template -o $@
	tidy -qim $@

clean:
	rm index.html blog/*
