build: www/fonts www/styles www/pages

www/fonts: www
	cp -r src/fonts www/fonts

www/styles: www
	cp -r src/styles www/styles

www/pages: www
	cp -r src/styles www/pages

www:
	mkdir www

.PHONY: clean
clean:
	rm -rf www