DOC_TEMPLATE=template.html
DOC_TARGET=index.html

all: Morsel Meddle WebSockets HttpServer HttpParser HttpCommon

readmeurl = "https://raw.github.com/hackerschool/$(1)/master/README.md"

#
# $(1) the GitHub repo name under the hackerschool organization
# $(2) the template directive
#
define curlandcompile
	$(shell if [ ! -f $(DOC_TARGET) ]; then
		cp $(DOC_TEMPLATE) $(DOC_TARGET);
	fi)
	$(eval HTML_TMP := $(shell mktemp 'tmp.html.XXXXX'))
	curl $(call readmeurl,$(1)) | markdown > $(HTML_TMP)
	sed -i '' -e "/$(2)/r $(HTML_TMP)" $(DOC_TARGET)
	rm -f $(HTML_TMP)
endef

Morsel:
	$(call curlandcompile,Morsel.jl,<!--!!!Morsel_content-->)

Meddle:
	$(call curlandcompile,Meddle.jl,<!--!!!Meddle_content-->)

WebSockets:
	$(call curlandcompile,WebSockets.jl,<!--!!!WebSockets_content-->)

HttpServer:
	$(call curlandcompile,HttpServer.jl,<!--!!!HttpServer_content-->)

HttpParser:
	$(call curlandcompile,HttpParser.jl,<!--!!!HttpParser_content-->)

HttpCommon:
	$(call curlandcompile,HttpCommon.jl,<!--!!!HttpCommon_content-->)

clean:
	rm -f tmp.html.*
	rm -f tmp.md.*
	rm -f $(DOC_TARGET)
