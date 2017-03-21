FROM base:0.0.2
ENV ELASTIC_VERSION 5.2.2
ENV ES_HOME /opt/elasticsearch
RUN yum install -y wget \
    && wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u121-b13//e9e7ea248e2c4826b92b3f075a80e441/jdk-8u121-linux-x64.rpm" \ 
    && rpm -ivh jdk-8u121-linux-x64.rpm \
    && rm -fr jdk-8u121-linux-x64.rpm
RUN wget https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-$ELASTIC_VERSION.tar.gz \
    && mkdir $ES_HOME \
    && mkdir $ES_HOME/data \
    && tar -xvzf elasticsearch-$ELASTIC_VERSION.tar.gz -C $ES_HOME --strip-components=1 \
    && rm -fr elasticsearch-$ELASTIC_VERSION.tar.gz
RUN groupadd elasticsearch \
    && useradd -r -u 1000 -g elasticsearch elasticsearch \
    && chown elasticsearch:elasticsearch -R $ES_HOME \
    && chown elasticsearch:elasticsearch -R $ES_HOME/data
WORKDIR $ES_HOME
VOLUME [ "$ES_HOME/config", "$ES_HOME/data" ]
EXPOSE 9200 9300
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "/opt/elasticsearch/bin/elasticsearch" ]
