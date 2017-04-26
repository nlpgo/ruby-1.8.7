
FROM debian:jessie

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get -y -q install \
        autoconf \
        bison \
	build-essential \
        curl \
        git-core \
        imagemagick \
	libsqlite3-dev \
        libcurl4-gnutls-dev \
        libmagickwand-dev \
        libmysqlclient-dev \
        libreadline6-dev \
        libssl-dev \
        libxml2 \
        libxslt1-dev \
        libyaml-dev \
        memcached \
        mysql-client \
        subversion \
        wget \
        zlib1g \
        zlib1g-dev \
     && rm -rf /var/lib/apt/lists/* \
     && wget -q -O ruby-1.8.7-p370.tar.gz http://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p370.tar.gz  \
     && tar xf ruby-1.8.7-p370.tar.gz   \
     && cd ruby-1.8.7-p370  \
     && ./configure \
     && make \
     && make install  \
     && ldconfig \
     && cd - \
     && rm -fr ruby-1.8.7-p370.tar.gz ruby-1.8.7-p370 \
     && ruby -v  \
     && git clone https://github.com/rubygems/rubygems.git \
     && cd rubygems \
     && git pull origin --tags \
     && git checkout v1.8.30 \
     && ruby setup.rb \
     && cd -  \
     && rm -fr rubygems


