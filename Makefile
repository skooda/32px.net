build: www/fonts www/styles www/$(shell ls src/pages)

www/fonts: www
	cp -r src/fonts www/fonts

www/styles: www
	cp -r src/styles www/styles

www/%.html: src/pages/%.html
	cp src/layout/header.html $@
	cat $< >> $@
	cat src/layout/footer.html >> $@

www:
	mkdir www

.PHONY: clean
clean:
	rm -rf www