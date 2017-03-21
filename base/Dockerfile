FROM centos:7.3.1611
RUN yum install -y wget epel-release \
    && yum install -y tmux lsof tcpdump net-tools htop sysstat iptraf psacct monit nethogs iftop suricata collectl \
    && wget http://sourceforge.net/projects/nmon/files/nmon16e_mpginc.tar.gz \
    && tar -xzvf nmon16e_mpginc.tar.gz \
    && cp nmon_x86_64_centos7 /usr/local/bin/nmon \
    && chmod a+x /usr/local/bin/nmon \
    && rm -f nmon_*
ENV GOSU_VERSION 1.10
RUN wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-amd64.asc" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && chmod +x /usr/local/bin/gosu \
    && rm -fr /usr/local/bin/gosu.asc \
    && gosu nobody true
