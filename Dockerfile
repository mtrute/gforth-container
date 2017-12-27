FROM debian:latest

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

RUN apt-get update \
    && apt-get install -y software-properties-common gnupg apt-utils \
    && apt-get install -y apt-transport-https curl \
    && apt-add-repository 'deb https://net2o.de/debian testing main' \
    && curl -L https://net2o.de/bernd@net2o.de-yubikey.pgp.asc | apt-key add -  \
    && apt-get update && apt-get upgrade -y \
    && apt-get install -y gforth 

CMD [ "gforth" ]
