FROM centos:8.2.2004

# Tini -  A tiny but valid init for container
ENV TINI_VERSION v0.19.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini

# SSH Daemon port
EXPOSE 22

RUN yum clean all && yum upgrade -y && yum -y install openssh openssh-server openssh-clients
   
# SSH files
RUN mkdir /root/.ssh && chmod 700 /root/.ssh
ADD ssh_server/* /etc/ssh/
ADD ssh/docker_ssh.pub /root/.ssh/authorized_keys
ADD start.sh /start.sh

RUN chmod +x /start.sh /tini 

ENTRYPOINT ["/tini", "-g", "--"]

CMD /start.sh
