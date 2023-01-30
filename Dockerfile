FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y bc \
                    apparmor \
                    apparmor-utils \
                    git \ 
                    openssh-server \
                    syslog-ng \
                    auditd \
                    iptables \
                    tcpd \
                    cron \
                    # tripwire \
                    chrony \
                    sudo


RUN echo 'GRUB_CMDLINE_LINUX="audit=1"' >> /etc/default/grub

RUN git clone https://github.com/ovh/debian-cis /opt/cis-hardening/ && \ 
    cd /opt/cis-hardening && \
    cp /opt/cis-hardening/debian/default /etc/default/cis-hardening && \
    sed -i "s#CIS_ROOT_DIR=.*#CIS_ROOT_DIR='/opt/cis-hardening'#" /etc/default/cis-hardening 

ADD ./conf.d/ /opt/cis-hardening/etc/conf.d/

VOLUME /opt/cis-hardening/etc/conf.d/

RUN cd /opt/cis-hardening && \
    ./bin/hardening.sh --apply --allow-unsupported-distribution
