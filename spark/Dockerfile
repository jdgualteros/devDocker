FROM hadoop:base

RUN adduser spark 
RUN echo 'spark:admin' | chpasswd
RUN echo 'root:admin' | chpasswd
RUN echo "spark ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

WORKDIR /opt

ADD resources/* .
RUN echo "ffds"
COPY start.sh .
RUN chmod +x start.sh
RUN chown -R spark:spark /opt

USER spark

RUN mv spark* spark && mkdir /opt/spark/logs

COPY conf/* spark/conf/.
ENV HADOOP_CONF_DIR=/opt/spark/conf/ \
SPARK_HOME=/opt/spark/

ENV PATH=$PATH:$HADOOP_CONF_DIR:${SPARK_HOME}/sbin:${SPARK_HOME}/bin


ENTRYPOINT ["/bin/bash","start.sh" ]