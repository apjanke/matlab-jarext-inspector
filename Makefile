# This Makefile is just for building the release distribution.
# It's not needed for just building or running the program

.PHONY: dist

PROGRAM=matlab-jarext-inspector
VERSION=$(shell cat VERSION)
DIST=dist/${PROGRAM}-${VERSION}
FILES=README.md LICENSE Mcode doc

dist:
	rm -rf dist/*
	mkdir -p ${DIST}
	cp -R $(FILES) $(DIST)
	cd dist; tar czf ${PROGRAM}-${VERSION}.tgz --exclude='*.DS_Store' ${PROGRAM}-${VERSION}
	cd dist; zip -rq ${PROGRAM}-${VERSION}.zip ${PROGRAM}-${VERSION} -x '*.DS_Store'
