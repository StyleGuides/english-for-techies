handouts:
	pandoc --from docbook --to latex -o dist/handouts/Writing\ killer\ documentation\ using\ the\ active\ voice.pdf en-US/topics/active.xml
	pandoc --from docbook --to latex -o dist/handouts/Writing\ clearly\ and\ to\ the\ point.pdf en-US/topics/minimalism.xml
	pandoc --from docbook --to latex -o dist/handouts/Writing\ sentences\ that\ use\ articles\ correctly.pdf en-US/topics/articles.xml

pdf:
	publican build --langs=en-US --formats=pdf --pub_dir=dist/
