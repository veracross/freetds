FROM ubuntu:16.04

ARG freetds_version=1.00.110

RUN apt-get update -qq && apt-get install -y --no-install-recommends build-essential libc6-dev wget ca-certificates
RUN wget https://github.com/veracross/freetds/raw/mirror-freetds-in-repo/freetds/freetds-${freetds_version}.tar.gz && \
    tar -xzf freetds-${freetds_version}.tar.gz && \
    cd freetds-${freetds_version} && \
    ./configure --prefix=/usr/local --with-tdsver=7.3 && \
    make && \
    make install

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
