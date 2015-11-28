FROM debian:jessie

ENV VIRTUOSO_COMMIT 4374f433fb6d07e147ac281de1440db0f2c80b55 

ENV BUILD_DEPS git autoconf flex bison gawk gperf libtool libssl-dev m4 make net-tools 

RUN apt-get update && \
    apt-get install -y ${BUILD_DEPS} && \
    GIT_SSL_NO_VERIFY=true git clone https://github.com/openlink/virtuoso-opensource.git && \
    cd virtuoso-opensource && \
    git checkout ${VIRTUOSO_COMMIT} && \
    ./autogen.sh && \
    CFLAGS="-O2 -m64" ./configure --prefix=/virtuoso --disable-bpel-vad --disable-dbpedia-vad --disable-demo-vad --disable-fct-vad --disable-isparql-vad --disable-ods-vad --disable-rdfmappers-vad --disable-rdb2rdf-vad --disable-sparqldemo-vad --disable-syncml-vad --disable-tutorial-vad && \
    make install && \
    rm -rf /virtuoso-opensource && \
    apt-get remove --purge -y ${BUILD_DEPS} && \
    apt-get autoremove -y && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/*

ENV PATH /virtuoso/bin/:$PATH

RUN mkdir /data

ADD start.sh /start.sh

EXPOSE 8890
EXPOSE 1111

CMD ["/bin/bash", "/start.sh"]
