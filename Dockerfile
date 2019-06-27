FROM alpine:3.9
LABEL maintainer="Matthias Trute <mtrute@web.de>"
ENV LANG C.UTF-8

ENV VERSION 0.7.9_20190627

RUN adduser -D gforth \
    && apk add --no-cache libltdl libffi \
    && apk add --no-cache --virtual .fetch-deps wget  file xz tar \
    && wget https://www.complang.tuwien.ac.at/forth/gforth/Snapshots/$VERSION/gforth-$VERSION.tar.xz -O /tmp/gforth.tar.xz \
    && xzcat /tmp/gforth.tar.xz | tar xf - -C /tmp  \
    && rm /tmp/gforth.tar.xz \
    && cd /tmp/gforth-* \
    && apk add --no-cache --virtual .build-deps freetype-dev \
        build-base m4 libtool \
        coreutils gcc swig libffi-dev mesa-gles mesa-dev libx11-dev \
        glfw-dev harfbuzz-dev gstreamer-dev gst-plugins-base-dev \
    && ./configure --prefix=/usr --exec-prefix=/usr \
    && make  \
    && make install -i \
    && cd /tmp && rm -rf gforth-* \
    && apk del .build-deps \
    && apk del .fetch-deps

USER gforth
CMD [ "gforth" ]
