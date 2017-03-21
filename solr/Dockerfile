FROM base:0.0.2
ENV SOLR_VERSION 5.5.4
ENV SOLR_HOME /opt/solr
RUN yum install -y wget lsof \
    && wget --quiet --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.rpm" \
    && rpm -ivh jdk-8u121-linux-x64.rpm \
    && rm -fr jdk-8u121-linux-x64.rpm
RUN wget --quiet http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz \
    && mkdir $SOLR_HOME \
    && tar -xvzf solr-$SOLR_VERSION.tgz -C $SOLR_HOME --strip-components=1 \
    && rm -fr solr-$SOLR_VERSION.tgz
RUN groupadd solr \
    && useradd -r -u 1000 -g solr solr \
    && chown solr:solr -R $SOLR_HOME
WORKDIR $SOLR_HOME
VOLUME [ \
	"$SOLR_HOME/conf" \
	"$SOLR_HOME/data" \
       ]
EXPOSE 8983
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "start", "-f", "-s", "/opt/solr/conf" ]
