DOC_TEMPLATE=template.html
DOC_TARGET=index.html

all: morsel

#
# $1: the location of the markdown file to be compiled
# $2: the directive to be replaced in index.html
#
define compilemd
	$(shell if [ ! -f $(DOC_TARGET) ]; then
		cp $(DOC_TEMPLATE) $(DOC_TARGET);
	fi)
	$(eval TMP := $(shell mktemp 'tmp.html.XXXXX'))
	markdown $(1) > $(TMP)
	sed -i '' -e "/$(2)/r $(TMP)" $(DOC_TARGET)
	rm $(TMP)
endef

morsel:
	$(call compilemd,tmp.md,<!--!!!morsel_content-->)

clean:
	rm -f tmp.html.*
	rm -f $(DOC_TARGET)
