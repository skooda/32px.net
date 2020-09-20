.PHONY: build
build: www www/fonts www/styles

.PHONY: netlify
netlify: build beautyurls

.PHONY: beautyurls
beautyurls: www
	find www -type f -name "*.html" -exec sed -i 's/.html//g' {} \;

www: wwwdir $(shell ls src/pages/|sed 's/[^ ]* */www\/&/g')

www/fonts: www
	cp -r src/fonts www/fonts

www/styles: www
	cp -r src/styles www/styles

www/%.html: src/pages/%.html
	cp src/layout/header.html $@
	cat $< >> $@
	cat src/layout/footer.html >> $@

wwwdir:
	mkdir www

.PHONY: clean
clean:
	rm -rf www