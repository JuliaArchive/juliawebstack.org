all: morsel

#
# $1: the location of the markdown file to be compiled
# $2: the directive to be replaced in index.html
#
define compilemd
	$(eval TMP := $(shell mktemp 'tmp.html.XXXXX'))
	markdown $(1) > $(TMP)
	sed -e '/$2/r $(TMP)' -e "s///" <index.html >out.html
	rm $(TMP)
endef

morsel:
	$(call compilemd,'tmp.md','{{morsel_content}}')

# $(call compilemd,'tmp.md','{{morsel_content}}')
# markdown tmp.md > tmp.html
# sed -e 's/{{morsel_content}}/r tmp.html' -e "s///" <index.html >out.html
# rm tmp.html
