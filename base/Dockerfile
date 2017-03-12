FROM centos:7.3.1611
RUN yum install -y wget epel-release \
    && yum install -y tmux lsof tcpdump net-tools htop sysstat iptraf psacct monit nethogs iftop suricata collectl \
    && wget http://sourceforge.net/projects/nmon/files/nmon16e_mpginc.tar.gz \
    && tar -xzvf nmon16e_mpginc.tar.gz \
    && cp nmon_x86_64_centos7 /usr/local/bin/nmon \
    && chmod a+x /usr/local/bin/nmon \
    && rm -f nmon_*
