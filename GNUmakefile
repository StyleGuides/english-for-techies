TITLE="English_for_Techies"

handouts:
	pandoc --from docbook --to latex -o dist/handouts/Writing\ killer\ documentation\ using\ the\ active\ voice.pdf en-US/topics/active.xml
	pandoc --from docbook --to latex -o dist/handouts/Writing\ clearly\ and\ to\ the\ point.pdf en-US/topics/minimalism.xml
	pandoc --from docbook --to latex -o dist/handouts/Writing\ sentences\ that\ use\ articles\ correctly.pdf en-US/topics/articles.xml
	pandoc --from docbook --to latex -o dist/handouts/Writing\ for\ noun\ and\ verb\ agreement.pdf en-US/topics/agreement.xml

pdf:
	xsltproc --output build/tmp.fo \
	--xinclude \
	--stringparam body.font.family "Red Hat Text Regular" \
        --stringparam title.font.family "Red Hat Display Black" \
        --stringparam bridgehead.font.family "Red Hat Display Regular" \
        --stringparam symbol.font.family "UniCons" \
        --stringparam body.font.master 12 \
        --stringparam body.font.size 12 \
        --stringparam chapter.autolabel 0 \
	/usr/share/sgml/docbook/xsl-stylesheets-1.79.2/fo/docbook.xsl \
	en-US/$(TITLE).xml
	fop -c style/rego.xml build/tmp.fo build/tmp.pdf
	@mv build/tmp.pdf dist/$(TITLE).pdf 
