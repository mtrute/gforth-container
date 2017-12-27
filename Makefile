
VERSION=0.7.9-20171206

all: Dockerfile
	docker build --force-rm -t gforth:${VERSION} -t gforth:latest .