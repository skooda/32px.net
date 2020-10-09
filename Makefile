.PHONY: build
build: www www/fonts www/styles www/images

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

www/images: www
	mkdir -p www/images/thumb/
	cp -r src/artwork/*-thumb.png www/images/thumb/
	ls src/artwork/*.png|grep -v "\-thumb"|while read F; do cp $$F www/images/; done

www/%.html: src/pages/%.html
	cp src/layout/header.html $@
	cat $< >> $@
	cat src/layout/footer.html >> $@

wwwdir:
	mkdir -p www

.PHONY: clean
clean:
	rm -rf www