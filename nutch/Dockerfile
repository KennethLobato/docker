FROM base:0.0.2
ENV NUTCH_VERSION 1.12
ENV NUTCH_HOME /opt/nutch
RUN yum install -y wget \
    && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13//e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.rpm" \
    && rpm -ivh jdk-8u121-linux-x64.rpm \
    && rm -fr jdk-8u121-linux-x64.rpm    
RUN wget http://apache.rediris.es/nutch/$NUTCH_VERSION/apache-nutch-$NUTCH_VERSION-bin.tar.gz \
    && mkdir $NUTCH_HOME \
    && tar -xvzf apache-nutch-$NUTCH_VERSION-bin.tar.gz -C $NUTCH_HOME --strip-components=1 \
    && rm -fr apache-nutch-$NUTCH_VERSION-bin.tar.gz
RUN groupadd nutch \
    && useradd -r -u 1000 -g nutch nutch \
    && mkdir /home/nutch \
    && chown nutch:nutch /home/nutch \
    && chown nutch:nutch -R $NUTCH_HOME
WORKDIR $NUTCH_HOME
VOLUME [ "$NUTCH_HOME/conf" ]
COPY bootstrap.sh /
RUN chmod +x /bootstrap.sh
ENTRYPOINT [ "/bootstrap.sh" ]
EXPOSE 8080 8081
CMD [ "standalone" ]
