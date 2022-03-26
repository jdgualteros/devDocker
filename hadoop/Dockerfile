FROM hadoop:base

RUN adduser hadoop 
RUN echo 'hadoop:admin' | chpasswd
RUN echo 'root:admin' | chpasswd
RUN chown -R hadoop /opt
RUN echo "hadoop ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

USER hadoop

WORKDIR /opt/
COPY conf/* .
ADD resources/hadoop-3.3.1.tar.gz . 

ENV HADOOP_HOME /opt/hadoop-3.3.1
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

RUN cat variable >> ~/.bashrc && . ~/.bashrc && rm variable
RUN echo "export JAVA_HOME=$JAVA_HOME" >> $HADOOP_HOME/etc/hadoop/hadoop-env.sh

RUN ssh-keygen -t rsa -P '' -f ~/.ssh/id_rsa && \
    cat ~/.ssh/id_rsa.pub > ~/.ssh/authorized_keys && \
    chmod 0600 ~/.ssh/authorized_keys

RUN cd $HADOOP_HOME/etc/hadoop && rm core-site.xml hdfs-site.xml yarn-site.xml mapred-site.xml
RUN mv *xml $HADOOP_HOME/etc/hadoop/.

RUN $HADOOP_HOME/bin/hdfs namenode -format


# Hdfs ports
# EXPOSE 9000 50010 50020 50070 50075 50090 56070
# EXPOSE 9871 9870 9820 9869 9868 9867 9866 9865 9864
# # Mapred ports
# EXPOSE 19888 10020 19888
# #Yarn ports
# EXPOSE 8030 8031 8032 8033 8040 8042 8088 8188
# #Other ports
# EXPOSE 49707 2122


RUN sudo chmod u+x script.sh
ENTRYPOINT ["/bin/bash", "/opt/script.sh"]