
MMARK := /home/rene/Dev/github/old-mmark/mmark/mmark/mmark -xml2 -page

rfc/build/%.xml: rfc/src/%.mdown spec/%/*
	mkdir -p $(@D)
	cat $< | $(MMARK) > $@

rfc/build/%.txt: rfc/build/%.xml
	xml2rfc --text `pwd`/$^ `pwd`/$@

rfc/build/%.html: rfc/build/%.xml
	xml2rfc --html `pwd`/$^ `pwd`/$@

.PHONY: build

build: rfc/build/quotas.txt rfc/build/quotas.html
xml: rfc/build/quotas.xml
