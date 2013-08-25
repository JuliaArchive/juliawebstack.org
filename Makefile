DOC_TEMPLATE=template.html
DOC_TARGET=index.html

all: clean Morsel Meddle WebSockets HttpServer HttpParser HttpCommon

readmeurl = "https://raw.github.com/hackerschool/$(1).jl/master/docs/$(1).md"

#
# $(1) the GitHub repo name under the hackerschool organization
# $(2) the template directive
#
define curlandcompile
	$(shell if [ ! -f $(DOC_TARGET) ]; then
		cp $(DOC_TEMPLATE) $(DOC_TARGET);
	fi)
	$(eval HTML_TMP := $(shell mktemp 'tmp.html.XXXXX'))
	curl -s $(call readmeurl,$(1)) \
		| python -m markdown -x "codehilite(noclasses=True)" \
		> $(HTML_TMP)
	sed -i '' -e "/$(2)/r $(HTML_TMP)" $(DOC_TARGET)
	rm -f $(HTML_TMP)
endef

Morsel:
	$(call curlandcompile,Morsel,<!--!!!Morsel_content-->)

Meddle:
	$(call curlandcompile,Meddle,<!--!!!Meddle_content-->)

WebSockets:
	$(call curlandcompile,WebSockets,<!--!!!WebSockets_content-->)

HttpServer:
	$(call curlandcompile,HttpServer,<!--!!!HttpServer_content-->)

HttpParser:
	$(call curlandcompile,HttpParser,<!--!!!HttpParser_content-->)

HttpCommon:
	$(call curlandcompile,HttpCommon,<!--!!!HttpCommon_content-->)

clean:
	rm -f tmp.html.*
	rm -f tmp.md.*
	rm -f $(DOC_TARGET)
