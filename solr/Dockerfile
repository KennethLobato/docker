FROM centos:7.3.1611
ENV SOLR_VERSION 5.5.4
RUN yum install -y wget \
    && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.rpm" \
    && rpm -ivh jdk-8u121-linux-x64.rpm \
    && rm -fr jdk-8u121-linux-x64.rpm
RUN wget http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz \
    && mkdir /opt/solr \
    && tar -xvzf solr-$SOLR_VERSION.tgz -C /opt/solr --strip-components=1 \
    && rm -fr solr-$SOLR_VERSION.tgz

