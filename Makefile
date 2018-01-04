
VERSION=0.7.9-20180103

all: Dockerfile
	docker build --force-rm -t gforth:${VERSION} -t gforth:latest .
