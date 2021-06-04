FROM amazonlinux:2

ARG FREETDS_VERSION=1.1.6

ENV INSTALLDIR='/tmp/freetds'
ENV FREETDS_VERSION=$FREETDS_VERSION

RUN yum update -y
RUN yum install wget build-essential libc6-dev tar gzip install -y
RUN yum group install "Development Tools" -y

RUN mkdir $INSTALLDIR
RUN mkdir '/var/task'

RUN wget https://github.com/veracross/freetds/raw/master/freetds/freetds-${FREETDS_VERSION}.tar.gz && \
    tar -xzf freetds-${FREETDS_VERSION}.tar.gz && \
    cd freetds-${FREETDS_VERSION} && \
    ./configure --prefix=${INSTALLDIR} --with-tdsver=7.3 && \
    make && \
    make install

RUN mkdir build

RUN cd /var/task && \
    mkdir lib build && \
    cp -a $INSTALLDIR /var/task && \
    cd $INSTALLDIR && \
    zip -r9 /var/task/build/freetds-layer-${FREETDS_VERSION}.zip ./lib
