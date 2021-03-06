# Dockerfile
FROM debian:jessie

ENV DEBIAN_FRONTEND noninteractive 
#RUN echo 'deb http://deb.debian.org/debian jessie-backports main' > /etc/apt/sources.list.d/backports.list
#RUN { \
#	echo 'Package: *'; \
#    echo 'Pin: release a=jessie-backports'; \
#    echo 'Pin-Priority: 501'; \
#} > /etc/apt/preferences.d/backports.pref
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install -y \ 
    build-essential \ 
    curl \ 
    devscripts \ 
    equivs \ 
    git-buildpackage \ 
    git \ 
    lsb-release \ 
    make \ 
    openssh-client \ 
    pristine-tar \ 
    rake \ 
    rsync \ 
    ruby \ 
    ruby-dev \ 
    rubygems \ 
    wget \
    debhelper

RUN echo "gem: --no-ri --no-rdoc" >/etc/gemrc 
RUN gem install fpm -v 1.4.0 
RUN gem install fpm-cookery -v 0.29.0 
RUN gem install buildtasks -v 0.0.1 
RUN gem install bundler -v 1.10.0

