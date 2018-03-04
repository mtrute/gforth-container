FROM alpine:latest
ENV LANG C.UTF-8

RUN apk add --no-cache libltdl libffi \
    && apk add --no-cache --virtual .fetch-deps \
        build-base wget m4 libtool file xz tar \
    && wget http://www.complang.tuwien.ac.at/forth/gforth/Snapshots/current/gforth.tar.xz -O /tmp/gforth.tar.xz \
    && xzcat /tmp/gforth.tar.xz | tar xf - -C /tmp  \
    && rm /tmp/gforth.tar.xz \
    && cd /tmp/gforth-* \
    && apk add --no-cache --virtual .build-deps \
        coreutils \
        gcc \
        swig \
        libffi-dev \
    && ./configure --prefix=/usr --exec-prefix=/usr \
    && make \
    && make install \
    && cd /tmp && rm -rf gforth-* \
    && apk del .build-deps \
    && apk del .fetch-deps

# ENTRYPOINT ["gforth"]

CMD [ "gforth" ]
