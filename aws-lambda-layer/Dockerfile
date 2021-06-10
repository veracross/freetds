FROM amazonlinux:2

ARG FREETDS_VERSION=1.1.6

ENV INSTALLDIR='/tmp/freetds'
ENV FREETDS_VERSION=$FREETDS_VERSION

RUN yum update -y
RUN yum install wget tar gzip zip gcc make -y

RUN mkdir $INSTALLDIR \
    build \
    '/var/task' \
    '/var/task/build'

RUN wget https://github.com/veracross/freetds/raw/master/freetds/freetds-${FREETDS_VERSION}.tar.gz && \
    tar -xzf freetds-${FREETDS_VERSION}.tar.gz && \
    cd freetds-${FREETDS_VERSION} && \
    ./configure --prefix=${INSTALLDIR} --with-tdsver=7.3 && \
    make && \
    make install

RUN cd $INSTALLDIR && \
    zip -r9 /var/task/build/freetds-layer-${FREETDS_VERSION}.zip ./lib
