FROM debian:latest

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV HOME /home/gforth
WORKDIR /home/gforth

RUN apt-get update \
    && mkdir -p /home/gforth \
    && groupadd -r gforth \
    && useradd -r -g gforth -d /home/gforth -s /bin/nologin -c "GForth Image User" gforth \
    && chown -R gforth:gforth $HOME \
    && apt-get install -y software-properties-common gnupg apt-utils \
    && apt-get install -y apt-transport-https curl \
    && apt-add-repository 'deb https://net2o.de/debian testing main' \
    && curl -L https://net2o.de/bernd@net2o.de-yubikey.pgp.asc | apt-key add -  \
    && apt-get update && apt-get upgrade -y \
    && apt-get install -y gforth 

CMD [ "gforth" ]
