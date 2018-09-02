find_file = $(patsubst %.md,%.html,$(subst src/,,$(filter %.md,$(shell find $(1)))))
ROOT = index.html
BLOG = $(call find_file,src/blog)
DND = $(call find_file,src/dnd)

.PHONY: all clean

all: $(ROOT) $(BLOG) $(DND)

define generate_file
	@echo "Creating $(2) from $(1)"
	@mkdir -p $(dir $(2))
	@pandoc -t html $(1) --template=src/template -V$(3) -o $(2)
	@tidy -qim $(2)
endef

%.html: src/%.md src/template.html
	$(call generate_file,$<,$@,'extra:')

blog/%.html: src/blog/%.md src/template.html
	$(call generate_file,$<,$@,'extra: - Lair of the Cyborgsphinx')

dnd/%.html: src/dnd/%.md src/template.html
	$(call generate_file,$<,$@,'extra: - Welcome to Thune')

dnd/legends/%.html: src/dnd/legends/%.md src/template.html
	$(call generate_file,$<,$@,'extra: - Legends of Thune')

dnd/pantheon/%.html: src/dnd/pantheon/%.md src/template.html
	$(call generate_file,$<,$@,'extra: - Pantheon of Thune')

dnd/races/%.html: src/dnd/races/%.md src/template.html
	$(call generate_file,$<,$@,'extra: - Races of Thune')


clean:
	rm $(ROOT) $(BLOG) $(DND)
