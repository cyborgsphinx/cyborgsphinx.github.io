ROOT = index.html
BLOG = $(shell ls src/blog/*.md | sed 's/\.md/\.html/' | sed 's/src\///')

.PHONY: all clean

all: $(ROOT) $(BLOG)

%.html: src/%.md src/template.html
	@echo "Creating $@ from $<"
	pandoc -t html $< --template=src/template -V'path: .' -o $@
	tidy -qim $@

blog/%.html: src/blog/%.md src/template.html
	@echo "Creating $@ from $<"
	pandoc -t html $< --template=src/template -V'path: ..' -V'extra: - Lair of the Cyborgsphinx' -o $@
	tidy -qim $@

clean:
	rm $(ROOT) $(BLOG)
