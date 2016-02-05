FROM	ubuntu:14.04
MAINTAINER	satish verma <satishsverma5@gmail.com>
# Update package list and upgrade the ubuntu
RUN \
     echo "nameserver 192.168.1.1" > /etc/resolv.conf && \
     apt-get install -y openssh-server && \
     apt-get update && \
     apt-get -y upgrade && \
     rm -rf /var/lib/apt/lists/*

# Configure openssh server
RUN mkdir /var/run/sshd
RUN echo 'root:satish' |chpasswd
RUN echo 'PermitRootLogin yes' > /etc/ssh/sshd_config  

EXPOSE 22

# Run openssh server as deamon
CMD    ["/usr/sbin/sshd", "-D"]
