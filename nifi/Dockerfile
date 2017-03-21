FROM base:0.0.2
ENV NIFI_VERSION 1.1.2
ENV NIFI_HOME /opt/nifi
ENV NIFI_TOOLKIT_HOME /opt/nifi-toolkit
RUN yum install -y wget \
    && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13/e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.rpm" \
    && rpm -ivh jdk-8u121-linux-x64.rpm \
    && rm -fr jdk-8u121-linux-x64.rpm
RUN wget http://apache.rediris.es/nifi/$NIFI_VERSION/nifi-$NIFI_VERSION-bin.tar.gz \
    && wget http://apache.rediris.es/nifi/$NIFI_VERSION/nifi-toolkit-$NIFI_VERSION-bin.tar.gz \
    && mkdir $NIFI_HOME \
    && mkdir $NIFI_TOOLKIT_HOME \
    && tar -xvzf nifi-$NIFI_VERSION-bin.tar.gz -C /opt/nifi --strip-components=1 \
    && tar -xvzf nifi-toolkit-$NIFI_VERSION-bin.tar.gz -C /opt/nifi-toolkit --strip-components=1 \
    && rm -fr nifi-$NIFI_VERSION-bin.tar.gz \
    && rm -fr nifi-toolkit-$NIFI_VERSION-bin.tar.gz
RUN groupadd nifi \
    && useradd -r -u 1000 -g nifi nifi \
    && chown nifi:nifi -R $NIFI_HOME \
    && chown nifi:nifi -R $NIFI_TOOLKIT_HOME
WORKDIR $NIFI_HOME
VOLUME [ \
	 "$NIFI_HOME/conf", \
	 "$NIFI_HOME/database_repository", \
         "$NIFI_HOME/flowfile_repository", \
         "$NIFI_HOME/content_repository", \
         "$NIFI_HOME/provenance_repository" \
       ]
EXPOSE 8080 8081
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
CMD ["run"]


