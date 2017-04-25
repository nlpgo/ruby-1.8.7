
FROM debian:jessie

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
    && apt-get -y -q install \
	build-essential \
        curl \
	libsqlite3-dev \
        libcurl4-gnutls-dev \
        libmagickwand-dev \
        libmysqlclient-dev \
        libxml2 \
        libxslt1-dev \
        libyaml-dev \
        git-core \
        mysql-client \
        imagemagick \
        memcached \
        wget \
        bison \
        libssl-dev \
        libreadline6-dev \
        autoconf \
        subversion \
        zlib1g \
        zlib1g-dev \
     && rm -rf /var/lib/apt/lists/*

RUN  \
     wget -q -O ruby-1.8.7-p370.tar.gz http://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p370.tar.gz  \
     && tar xvf ruby-1.8.7-p370.tar.gz   \
     && cd ruby-1.8.7-p370  \
     && ./configure \
     && make \
     && make install  \
     && ldconfig

# # Build Ruby
# RUN wget -q -O ruby-1.8.7-p370.tar.gz http://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p370.tar.gz
# RUN tar xvf ruby-1.8.7-p370.tar.gz
# RUN rm ruby-1.8.7-p370.tar.gz
# WORKDIR ruby-1.8.7-p370
# RUN ./configure
# RUN make
# RUN make install

