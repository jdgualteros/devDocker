FROM ubuntu

RUN apt-get update 
RUN apt-get install -y wget ssh rsync 
RUN apt-get install -y openssh-server openjdk-8-jdk wget net-tools vim
RUN apt-get install -y sudo

# RUN service ssh start
# CMD ["/usr/sbin/sshd","-D"]

RUN /etc/init.d/ssh start && systemctl enable ssh
