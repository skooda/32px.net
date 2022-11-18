.PHONY: build
build: www www/fonts www/styles www/images www/assets

.PHONY: netlify
netlify: build beautyurls

.PHONY: beautyurls
beautyurls: www
	find www -type f -name "*.html" -exec sed -i 's/.html//g' {} \;	

www: wwwdir $(shell ls src/pages/|sed 's/[^ ]* */www\/&/g') $(shell ls src/artwork/|grep ".png"|sed 's/[^ ]* */www\/img-&/g;s/\.png/\.html/g')

www/fonts: www
	cp -r src/fonts www/fonts

www/styles: www
	cp -r src/styles www/styles

www/images: www
	mkdir -p www/images/thumb/
	cp -r src/artwork/thumb www/images/
	cp -r src/artwork/*.png www/images/

www/assets: www
	cp -r src/assets www/assets

www/%.html: src/pages/%.html
	cp src/layout/header.html $@
	cat $< >> $@
	cat src/layout/footer.html >> $@

www/img-%.html: src/artwork/%.png
	cat src/layout/image.html|sed "s/%IMG%/$*/g" >> $@

wwwdir:
	mkdir -p www

.PHONY: clean
clean:
	rm -rf www