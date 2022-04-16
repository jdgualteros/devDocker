FROM jenkins/jenkins:lts
USER root
RUN apt-get update && apt-get install -y lsb-release
RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
  https://download.docker.com/linux/debian/gpg
RUN echo "deb [arch=$(dpkg --print-architecture) \
  signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
  https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
RUN apt-get update && apt-get install -y docker-ce-cli
RUN echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
# RUN mkdir /etc/docker
# RUN echo "{ \"insecure-registries\": [\"nexus:8085\"]}" > /etc/docker/daemon.json
USER jenkins
COPY plugins.txt /opt
# RUN /usr/local/bin/plugins.sh /opt/plugins.txt
# RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"
RUN /usr/local/bin/install-plugins.sh > /opt/plugins.txt