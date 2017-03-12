FROM centos:7.3.1611
ENV NUTCH_VERSION 1.12
RUN yum install -y wget \
    && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13//e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.rpm" \
    && rpm -ivh jdk-8u121-linux-x64.rpm \
    && rm -fr jdk-8u121-linux-x64.rpm    
RUN wget http://apache.rediris.es/nutch/$NUTCH_VERSION/apache-nutch-$NUTCH_VERSION-bin.tar.gz \
    && mkdir /opt/nutch \
    && tar -xvzf apache-nutch-$NUTCH_VERSION-bin.tar.gz -C /opt/nutch --strip-components=1 \
    && rm -fr apache-nutch-$NUTCH_VERSION-bin.tar.gz
ADD conf/nutch-site.xml /opt/nutch/conf/nutch-site.xml
ADD bootstrap.sh /opt/nutch/bootstrap.sh
RUN chmod a+x /opt/nutch/bootstrap.sh
EXPOSE 8080 8081 
CMD ["/opt/nutch/bootstrap.sh", "-d"]

